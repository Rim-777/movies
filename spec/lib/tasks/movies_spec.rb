# frozen_string_literal: true

require 'rails_helper'
require 'rake'

describe 'movies' do
  before do
    Rake.application.rake_require 'tasks/movies'
    Rake::Task.define_task(:environment)
  end

  let :run_migration do
    task = 'movies:migrate'
    Rake::Task[task].reenable
    Rake.application.invoke_task task
  end

  let(:movies_content) do
    file_path = Rails.root.join('lib', 'storage', 'movies.csv')
    File.read(file_path)
  end

  let(:reviews_content) do
    file_path = Rails.root.join('lib', 'storage', 'reviews.csv')
    File.read(file_path)
  end

  it 'initialise MoviesImport with expected arguments' do
    expect(Movies::Import).to receive(:new).with(movies_content).and_call_original
    run_migration
  end

  it 'initialise ReviewsImport with expected arguments' do
    expect(Reviews::Import).to receive(:new).with(reviews_content).and_call_original
    run_migration
  end

  let(:movies_import_instance) { Movies::Import.new(movies_content) }
  let(:reviews_import_instance) { Movies::Import.new(reviews_content) }

  it 'performs import' do
    allow(Movies::Import).to receive(:new).and_return(movies_import_instance)
    allow(Reviews::Import).to receive(:new).and_return(reviews_import_instance)
    expect(movies_import_instance).to receive(:call)
    expect(reviews_import_instance).to receive(:call)
    run_migration
  end
end
