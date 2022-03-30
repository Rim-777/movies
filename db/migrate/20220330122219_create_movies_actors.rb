class CreateMoviesActors < ActiveRecord::Migration[7.0]
  def change
    create_table :movies_actors do |t|
      t.integer :movie_id, null: false, foreign_key: true
      t.integer :actor_id, null: false, foreign_key: true

      t.index(%i[movie_id actor_id], unique: true)
      t.timestamps
    end
  end
end
