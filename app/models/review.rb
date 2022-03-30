# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :movie, inverse_of: :reviews
  belongs_to :user, inverse_of: :reviews

  validates :review_text, :stars, presence: true
  validates :user_id, uniqueness: { scope: :movie_id }
end
