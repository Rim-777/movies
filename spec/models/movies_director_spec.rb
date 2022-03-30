require 'rails_helper'

RSpec.describe MoviesDirector, type: :model do
  it { should belong_to(:movie).inverse_of(:movies_directors) }
  it { should belong_to(:director).inverse_of(:movies_directors) }

  describe 'validations' do
    let(:subject) do
      build(:movies_director, movie_id: 'id', director_id: 'id')
    end

    it { should validate_uniqueness_of(:director_id).scoped_to(:movie_id) }
  end
end
