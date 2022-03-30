# frozen_string_literal: true

class Actor < ApplicationRecord
  has_many :movies_actors, inverse_of: :actor, dependent: :destroy
  has_many :movies, through: :movies_actors

  validates :name, presence: true, uniqueness: true
end
