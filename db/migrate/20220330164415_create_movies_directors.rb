class CreateMoviesDirectors < ActiveRecord::Migration[7.0]
  def change
    create_table :movies_directors do |t|
      t.integer :movie_id, null: false, foreign_key: true
      t.integer :director_id, null: false, foreign_key: true

      t.index(%i[movie_id director_id], unique: true)
      t.timestamps
    end
  end
end
