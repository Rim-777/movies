# frozen_string_literal: true

class Movie < ApplicationRecord
  has_many :movies_actors, inverse_of: :movie, dependent: :destroy
  has_many :actors, through: :movies_actors

  has_many :movies_countries, inverse_of: :movie, dependent: :destroy
  has_many :countries, through: :movies_countries

  has_many :movies_filming_locations, inverse_of: :movie, dependent: :destroy
  has_many :filming_locations, through: :movies_filming_locations

  has_many :movies_directors,
           inverse_of: :movie,
           dependent: :destroy

  has_many :directors, through: :movies_directors

  has_many :reviews, inverse_of: :movie, dependent: :destroy

  validates :name, :description, :year, presence: true
  validates :name, uniqueness: { scope: :year }
  validates_format_of :year, with: /\A(\d){4}\z/
end
