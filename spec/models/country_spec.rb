require 'rails_helper'

RSpec.describe Country, type: :model do
  it { should have_many(:movies_countries).inverse_of(:country).dependent(:destroy) }
  it { should have_many(:movies) }

  describe 'validations' do
    let(:subject) do
      build(:country, name: 'Some Name')
    end

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
end
