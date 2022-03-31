namespace :movies do
  task migrate: :environment do
    PopulateEntities.call
  end
end
