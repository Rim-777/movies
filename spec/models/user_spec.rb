require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:reviews).inverse_of(:user).dependent(:destroy) }

  describe 'validations' do
    let(:subject) do
      build(:user, name: 'Some name')
    end

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
end
