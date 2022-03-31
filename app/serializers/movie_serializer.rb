class MovieSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description, :year

  has_many :directors
  has_many :actors
  has_many :filming_locations
  has_many :countries
  has_many :reviews
end
