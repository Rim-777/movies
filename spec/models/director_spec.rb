require 'rails_helper'

RSpec.describe Director, type: :model do
  it { should have_many(:movies_directors).inverse_of(:director).dependent(:destroy) }
  it { should have_many(:movies) }

  describe 'validations' do
    let(:subject) do
      build(:director, name: 'Some Name')
    end

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
end
