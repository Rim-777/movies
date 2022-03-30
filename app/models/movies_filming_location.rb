# frozen_string_literal: true

class MoviesFilmingLocation < ApplicationRecord
  belongs_to :movie, inverse_of: :movies_filming_locations
  belongs_to :filming_location, inverse_of: :movies_filming_locations

  validates :filming_location_id, uniqueness: { scope: :movie_id }
end
