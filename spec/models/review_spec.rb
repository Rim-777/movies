require 'rails_helper'

RSpec.describe Review, type: :model do
  it { should belong_to(:user).inverse_of(:reviews) }
  it { should belong_to(:movie).inverse_of(:reviews) }

  describe 'validations' do
    let(:subject) do
      build(
        :review,
        review_text: 'Some Text',
        stars: 5,
        user_id: 'id',
        movie_id: 'id'
      )
    end

    it { should validate_presence_of(:review_text) }
    it { should validate_presence_of(:stars) }
    it { should validate_uniqueness_of(:user_id).scoped_to(:movie_id) }
  end
end
