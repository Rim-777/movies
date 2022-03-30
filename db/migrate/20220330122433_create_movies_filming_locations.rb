class CreateMoviesFilmingLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :movies_filming_locations do |t|
      t.integer :movie_id, null: false, foreign_key: true
      t.integer :filming_location_id, null: false, foreign_key: true

      t.index(
        %i[movie_id filming_location_id],
        unique: true,
        name: 'index_mov_film_locations_on_movie_id_and_filming_location_id'
      )
      t.timestamps
    end
  end
end
