require 'rails_helper'

RSpec.describe Actor, type: :model do
  it { should have_many(:movies_actors).inverse_of(:actor).dependent(:destroy) }
  it { should have_many(:movies) }

  describe 'validations' do
    let(:subject) do
      build(:actor, name: 'Some Name')
    end

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
end
