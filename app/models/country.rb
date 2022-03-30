# frozen_string_literal: true

class Country < ApplicationRecord
  has_many :movies_countries, inverse_of: :country, dependent: :destroy
  has_many :movies, through: :movies_countries

  validates :name, presence: true, uniqueness: true
end
