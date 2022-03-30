# frozen_string_literal: true

class MoviesCountry < ApplicationRecord
  belongs_to :movie, inverse_of: :movies_countries
  belongs_to :country, inverse_of: :movies_countries

  validates :country_id, uniqueness: { scope: :movie_id }
end
