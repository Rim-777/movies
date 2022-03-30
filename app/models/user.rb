# frozen_string_literal: true

class User < ApplicationRecord
  has_many :reviews, inverse_of: :user, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
