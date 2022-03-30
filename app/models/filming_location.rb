# frozen_string_literal: true

class FilmingLocation < ApplicationRecord
  has_many :movies_filming_locations,
           inverse_of: :filming_location,
           dependent: :destroy

  has_many :movies, through: :movies_filming_locations

  validates :name, presence: true, uniqueness: true
end
