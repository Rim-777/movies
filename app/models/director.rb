# frozen_string_literal: true

class Director < ApplicationRecord
  has_many :movies_directors,
           inverse_of: :director,
           dependent: :destroy

  has_many :movies, through: :movies_directors

  validates :name, presence: true, uniqueness: true
end
