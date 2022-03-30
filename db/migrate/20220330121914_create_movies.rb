class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :year, null: false
      t.index(%i[name year], unique: true)
      t.timestamps
    end
  end
end
