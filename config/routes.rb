Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  api vendor_string: 'movies-api', default_version: 1 do
    version 1 do
      cache as: 'v1' do
        resources :movies, only: %i[index]
        resources :actors, only: %i[index]
      end
    end
  end
end
