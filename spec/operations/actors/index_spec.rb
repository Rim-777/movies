# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Actors::Index do
  let(:operation) { described_class.new }

  describe '#call' do
    before do
      PopulateEntities.call
      operation.call
    end

    it 'returns an instance of an expected class' do
      expect(operation.result).to be_a(ActiveRecord::Relation)
    end

    it 'returns instances of an expected class' do
      operation.result.each do |actor|
        expect(actor).to be_a(Actor)
      end
    end

    context 'with no params' do
      it 'returns expected number of records' do
        expect(operation.result.count).to eq(5)
      end
    end

    context 'with params' do
      context 'actor is found' do
        let(:operation) { described_class.new(name: 'Nic') }

        it 'returns expected number of records' do
          expect(operation.result.count).to eq(1)
        end

        it 'returns expected number of records' do
          expect(operation.result.first.name).to eq('Nicolas Cage')
        end
      end

      context 'actor is not found' do
        let(:operation) { described_class.new(name: 'abc') }

        it 'returns expected number of records' do
          expect(operation.result.count).to be_zero
        end
      end
    end
  end
end
