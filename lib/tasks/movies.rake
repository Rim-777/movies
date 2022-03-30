namespace :movies do
  task migrate: :environment do
    file_path = Rails.root.join('lib', 'storage', 'movies.csv')
    content = File.read(file_path)
    MoviesImport.new(content).call

    file_path = Rails.root.join('lib', 'storage', 'reviews.csv')
    content = File.read(file_path)
    ReviewsImport.new(content).call
  end
end

