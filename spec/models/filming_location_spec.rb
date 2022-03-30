require 'rails_helper'

RSpec.describe FilmingLocation, type: :model do
  it do
    should have_many(:movies_filming_locations)
      .inverse_of(:filming_location)
      .dependent(:destroy)
  end

  it { should have_many(:movies) }

  describe 'validations' do
    let(:subject) do
      build(:filming_location, name: 'Some Name')
    end

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
end
