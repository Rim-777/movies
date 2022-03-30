# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_220_330_164_415) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'actors', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['name'], name: 'index_actors_on_name', unique: true
  end

  create_table 'countries', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['name'], name: 'index_countries_on_name', unique: true
  end

  create_table 'directors', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['name'], name: 'index_directors_on_name', unique: true
  end

  create_table 'filming_locations', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['name'], name: 'index_filming_locations_on_name', unique: true
  end

  create_table 'movies', force: :cascade do |t|
    t.string 'name', null: false
    t.text 'description', null: false
    t.string 'year', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[name year], name: 'index_movies_on_name_and_year', unique: true
  end

  create_table 'movies_actors', force: :cascade do |t|
    t.integer 'movie_id', null: false
    t.integer 'actor_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[movie_id actor_id], name: 'index_movies_actors_on_movie_id_and_actor_id', unique: true
  end

  create_table 'movies_countries', force: :cascade do |t|
    t.integer 'movie_id', null: false
    t.integer 'country_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[movie_id country_id], name: 'index_movies_countries_on_movie_id_and_country_id', unique: true
  end

  create_table 'movies_directors', force: :cascade do |t|
    t.integer 'movie_id', null: false
    t.integer 'director_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[movie_id director_id], name: 'index_movies_directors_on_movie_id_and_director_id', unique: true
  end

  create_table 'movies_filming_locations', force: :cascade do |t|
    t.integer 'movie_id', null: false
    t.integer 'filming_location_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[movie_id filming_location_id], name: 'index_mov_film_locations_on_movie_id_and_filming_location_id',
                                              unique: true
  end

  create_table 'reviews', force: :cascade do |t|
    t.text 'review_text', null: false
    t.integer 'movie_id', null: false
    t.integer 'user_id', null: false
    t.integer 'stars', default: 0, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[movie_id user_id], name: 'index_reviews_on_movie_id_and_user_id', unique: true
    t.index ['stars'], name: 'index_reviews_on_stars'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['name'], name: 'index_users_on_name', unique: true
  end
end
