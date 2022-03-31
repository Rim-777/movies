# frozen_string_literal: true

module PopulateEntities
  extend self

  def call
    file_path = Rails.root.join('lib', 'storage', 'movies.csv')
    content = File.read(file_path)
    Movies::Import.new(content).call

    file_path = Rails.root.join('lib', 'storage', 'reviews.csv')
    content = File.read(file_path)
    Reviews::Import.new(content).call
  end
end
