require 'rails_helper'

RSpec.describe Movie, type: :model do
  it { should have_many(:movies_actors).inverse_of(:movie).dependent(:destroy) }
  it { should have_many(:actors) }
  it { should have_many(:movies_countries).inverse_of(:movie).dependent(:destroy) }
  it { should have_many(:countries) }
  it { should have_many(:movies_filming_locations).inverse_of(:movie).dependent(:destroy) }
  it { should have_many(:filming_locations) }
  it { should have_many(:movies_directors).inverse_of(:movie).dependent(:destroy) }
  it { should have_many(:directors) }
  it { should have_many(:reviews).inverse_of(:movie).dependent(:destroy) }

  describe 'validations' do
    let(:subject) do
      build(
        :movie,
        name: 'Name',
        description: 'Some text',
        year: '2000'
      )
    end

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).scoped_to(:year) }
    it { should allow_value('2000').for(:year) }
    it { should_not allow_value('2').for(:year) }
    it { should_not allow_value('20').for(:year) }
    it { should_not allow_value('200').for(:year) }
    it { should_not allow_value('200e').for(:year) }
  end
end
