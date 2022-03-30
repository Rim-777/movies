class CreateMoviesCountries < ActiveRecord::Migration[7.0]
  def change
    create_table :movies_countries do |t|
      t.integer :movie_id, null: false, foreign_key: true
      t.integer :country_id, null: false, foreign_key: true

      t.index(%i[movie_id country_id], unique: true)
      t.timestamps
    end
  end
end
