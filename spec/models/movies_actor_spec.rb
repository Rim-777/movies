require 'rails_helper'

RSpec.describe MoviesActor, type: :model do
  it { should belong_to(:movie).inverse_of(:movies_actors) }
  it { should belong_to(:actor).inverse_of(:movies_actors) }

  describe 'validations' do
    let(:subject) do
      build(:movies_actor, movie_id: 'id', actor_id: 'id')
    end

    it { should validate_uniqueness_of(:actor_id).scoped_to(:movie_id) }
  end
end
