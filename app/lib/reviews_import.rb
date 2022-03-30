# frozen_string_literal: true

require 'csv'

class ReviewsImport
  def initialize(content)
    @content = content
  end

  def call
    rows = CSV.parse(@content, headers: true)
    rows.each do |row|
      movie_name = row.fetch('Movie').strip
      review_text = row.fetch('Review').strip
      stars = row.fetch('Stars').strip
      user_name = row.fetch('User').strip

      ActiveRecord::Base.transaction do
        ActiveRecord::Base.connection.execute(<<~SQL).clear
          lock users in share row exclusive mode;
          lock reviews in share row exclusive mode;
        SQL

        add_review!(user!(user_name), movie!(movie_name), review_text, stars)
      end
    end
  end

  private

  def movie!(movie_name)
    Movie.find_by!(name: movie_name)
  end

  def user!(user_name)
    User.find_by(name: user_name) ||
      User.create!(name: user_name)
  end

  def add_review!(user, movie, review_text, stars)
    return if Review.find_by(user: user, movie: movie)

    Review.create!(
      user: user,
      movie: movie,
      review_text: review_text,
      stars: stars
    )
  end
end
