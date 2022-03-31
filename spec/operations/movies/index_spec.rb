# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movies::Index do
  let(:operation) { described_class.new }

  describe '#call' do
    before do
      PopulateEntities.call
      operation.call
    end

    it 'returns expected number of records' do
      expect(operation.result.to_a.count).to eq(2)
    end

    it 'returns an instance of an expected class' do
      expect(operation.result).to be_a(ActiveRecord::Relation)
    end

    it 'returns instances of an expected class' do
      operation.result.each do |movie|
        expect(movie).to be_a(Movie)
      end
    end

    it 'sorts by average review stars desc' do
      first = operation.result.first
      second = operation.result.second
      expect(first.reviews.average(:stars) > second.reviews.average(:stars)).to be(true)
    end
  end
end
