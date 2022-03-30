# frozen_string_literal: true

class MoviesActor < ApplicationRecord
  belongs_to :movie, inverse_of: :movies_actors
  belongs_to :actor, inverse_of: :movies_actors

  validates :actor_id, uniqueness: { scope: :movie_id }
end
