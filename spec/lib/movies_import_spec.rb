# frozen_string_literal: true

require 'rails_helper'

describe Movies::Import do
  let(:content) do
    file_path = Rails.root.join('lib', 'storage', 'movies.csv')
    File.read(file_path)
  end

  let(:subject) { described_class.new(content) }

  def subject_call
    subject.call
  end

  let(:gone_in_60_seconds) { Movie.find_by(name: 'Gone in 60 seconds') }
  let(:inception) { Movie.find_by(name: 'Inception') }

  it 'add expected number of movies' do
    expect { subject_call }.to change(Movie, :count).from(0).to(2)
  end

  it 'correctly assigns movie attributes to movies' do
    subject_call
    expect(gone_in_60_seconds).to have_attributes(
      name: 'Gone in 60 seconds',
      description: a_string_ending_with("his brother's life."),
      year: '2000'
    )

    expect(inception).to have_attributes(
      name: 'Inception',
      description: a_string_ending_with('mind of a CEO.'),
      year: '2010'
    )
  end

  it 'add expected number of actors' do
    expect { subject_call }.to change(Actor, :count).from(0).to(5)
  end

  it 'relates actors to movies' do
    subject_call
    expect(gone_in_60_seconds.actors).to contain_exactly(
      an_object_having_attributes(name: 'Nicolas Cage'),
      an_object_having_attributes(name: 'Leonardo Di Caprio'),
      an_object_having_attributes(name: 'Giovani Ribisi')
    )
    expect(inception.actors).to contain_exactly(
      an_object_having_attributes(name: 'Ellen Page'),
      an_object_having_attributes(name: 'Leonardo Di Caprio'),
      an_object_having_attributes(name: 'Giovani Ribisi'),
      an_object_having_attributes(name: 'Joseph Gordon Levitt')
    )
  end

  it 'add expected number of directors' do
    expect { subject_call }.to change(Director, :count).from(0).to(2)
  end

  it 'relates directors to movies' do
    subject_call
    expect(gone_in_60_seconds.directors).to contain_exactly(
      an_object_having_attributes(name: 'Dominic Sena')
    )

    expect(inception.directors).to contain_exactly(
      an_object_having_attributes(name: 'Christopher Nolan')
    )
  end

  it 'add expected number of filming location' do
    expect { subject_call }.to change(FilmingLocation, :count).from(0).to(3)
  end

  it 'relates filming locations to movies' do
    subject_call
    expect(gone_in_60_seconds.filming_locations).to contain_exactly(
      an_object_having_attributes(name: 'Los Angeles'),
      an_object_having_attributes(name: 'Lone Pine')
    )

    expect(inception.filming_locations).to contain_exactly(
      an_object_having_attributes(name: 'Los Angeles'),
      an_object_having_attributes(name: 'BedfordShire')
    )
  end

  it 'add expected number of countries' do
    expect { subject_call }.to change(Country, :count).from(0).to(2)
  end

  it 'relates countries to movies' do
    subject_call
    expect(gone_in_60_seconds.countries).to contain_exactly(
      an_object_having_attributes(name: 'US')
    )

    expect(inception.countries).to contain_exactly(
      an_object_having_attributes(name: 'US'),
      an_object_having_attributes(name: 'UK')
    )
  end
end
