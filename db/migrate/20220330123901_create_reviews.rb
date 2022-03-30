class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.text :review_text, null: false
      t.integer :movie_id, null: false, foreign_key: true
      t.integer :user_id, null: false, foreign_key: true
      t.integer :stars, null: false, default: 0, index: true

      t.index(%i[movie_id user_id], unique: true)
      t.timestamps
    end
  end
end
