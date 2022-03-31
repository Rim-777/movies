# frozen_string_literal: true

require 'rails_helper'

describe Reviews::Import do
  let!(:gone_in_60_seconds) do
    create(
      :movie,
      name: 'Gone in 60 seconds',
      description: 'some text',
      year: '2000'
    )
  end

  let!(:inception) do
    create(
      :movie,
      name: 'Inception',
      description: 'some text',
      year: '2000'
    )
  end

  let(:content) do
    file_path = Rails.root.join('lib', 'storage', 'reviews.csv')
    File.read(file_path)
  end

  let(:subject) { Reviews::Import.new(content) }

  def subject_call
    subject.call
  end

  it 'adds expected number of users' do
    expect { subject_call }.to change(User, :count).from(0).to(7)
  end

  it 'adds expected number of reviews' do
    expect { subject_call }.to change(Review, :count).from(0).to(9)
  end

  it 'adds expected number of reviews for gone_in_60_seconds' do
    expect { subject_call }.to change(inception.reviews, :count).from(0).to(4)
  end

  context 'gone in 60 seconds' do
    it 'adds expected number of reviews' do
      expect { subject_call }.to change(gone_in_60_seconds.reviews, :count).from(0).to(5)
    end

    let(:reviewer_names) do
      User.joins(reviews: [:movie])
          .where(movies: { name: gone_in_60_seconds.name })
          .pluck(:name)
    end

    it 'adds reviews to movies' do
      subject_call
      expect(reviewer_names).to contain_exactly(
        'Axel Ontheway',
        'Chris Bla',
        'Peter Troll',
        'Sam Pedro',
        'Suzan Something'
      )
    end
  end

  context 'inception' do
    it 'adds expected number of reviews' do
      expect { subject_call }.to change(inception.reviews, :count).from(0).to(4)
    end

    let(:reviewer_names) do
      User.joins(reviews: [:movie])
          .where(movies: { name: inception.name })
          .pluck(:name)
    end

    it 'relates reviews to movies and users' do
      subject_call
      expect(reviewer_names).to contain_exactly(
        'Mack Boe',
        'Peter Troll',
        'Rik van der Kroon',
        'Sam Pedro'
      )
    end
  end
end
