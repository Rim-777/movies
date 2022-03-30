# frozen_string_literal: true

require 'csv'

class MoviesImport
  def initialize(content)
    @content = content
  end

  def call
    rows = CSV.parse(@content, headers: true)
    rows.each do |row|
      name = row.fetch('Movie').strip
      description = row.fetch('Description').strip
      year = row.fetch('Year').strip
      director_name = row.fetch('Director').strip
      actor_name = row.fetch('Actor').strip
      location_name = row.fetch('Filming location').strip
      country_name = row.fetch('Country').strip

      ActiveRecord::Base.transaction do
        ActiveRecord::Base.connection.execute(<<~SQL).clear
          lock movies in share row exclusive mode;
          lock actors in share row exclusive mode;
          lock filming_locations in share row exclusive mode;
          lock countries in share row exclusive mode;
        SQL

        movie = set_movie!(name, description, year)
        add_director!(movie, director_name)
        add_actor!(movie, actor_name)
        add_filming_location!(movie, location_name)
        add_country!(movie, country_name)
      end
    end
  end

  private

  def set_movie!(name, description, year)
    Movie.find_by(name: name, year: year) ||
    Movie.create!(name: name, description: description, year: year)
  end

  def add_director!(movie, director_name)
    director =
      Director.find_by(name: director_name) ||
      Director.create!(name: director_name)
    return if movie.directors.include?(director)

    movie.directors << director
  end

  def add_actor!(movie, actor_name)
    actor =
      Actor.find_by(name: actor_name) ||
      Actor.create!(name: actor_name)
    return if movie.actors.include?(actor)

    movie.actors << actor
  end

  def add_filming_location!(movie, location_name)
    location =
      FilmingLocation.find_by(name: location_name) ||
      FilmingLocation.create!(name: location_name)
    return if movie.filming_locations.include?(location)

    movie.filming_locations << location
  end

  def add_country!(movie, country_name)
    country =
      Country.find_by(name: country_name) ||
      Country.create!(name: country_name)
    return if movie.countries.include?(country)

    movie.countries << country
  end
end
