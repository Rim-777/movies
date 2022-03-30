require 'rails_helper'

RSpec.describe MoviesFilmingLocation, type: :model do
  it { should belong_to(:movie).inverse_of(:movies_filming_locations) }
  it { should belong_to(:filming_location).inverse_of(:movies_filming_locations) }

  describe 'validations' do
    let(:subject) do
      build(:movies_filming_location, movie_id: 'id', filming_location_id: 'id')
    end

    it { should validate_uniqueness_of(:filming_location_id).scoped_to(:movie_id) }
  end
end
