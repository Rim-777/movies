require 'rails_helper'

RSpec.describe MoviesCountry, type: :model do
  it { should belong_to(:movie).inverse_of(:movies_countries) }
  it { should belong_to(:country).inverse_of(:movies_countries) }

  describe 'validations' do
    let(:subject) do
      build(:movies_country, movie_id: 'id', country_id: 'id')
    end

    it { should validate_uniqueness_of(:country_id).scoped_to(:movie_id) }
  end
end
