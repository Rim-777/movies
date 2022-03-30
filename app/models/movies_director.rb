class MoviesDirector < ApplicationRecord
  belongs_to :movie, inverse_of: :movies_directors
  belongs_to :director, inverse_of: :movies_directors

  validates :director_id, uniqueness: { scope: :movie_id }
end
