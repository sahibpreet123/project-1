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

ActiveRecord::Schema[7.1].define(version: 2024_03_14_145347) do
  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.string "imageURL"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "films", force: :cascade do |t|
    t.string "name"
    t.integer "character_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_films_on_character_id"
  end

  create_table "likeds", force: :cascade do |t|
    t.integer "character_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_likeds_on_character_id"
    t.index ["user_id"], name: "index_likeds_on_user_id"
  end

  create_table "tv_shows", force: :cascade do |t|
    t.string "name"
    t.integer "character_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_tv_shows_on_character_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "video_games", force: :cascade do |t|
    t.string "name"
    t.integer "character_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_video_games_on_character_id"
  end

  add_foreign_key "films", "characters"
  add_foreign_key "likeds", "characters"
  add_foreign_key "likeds", "users"
  add_foreign_key "tv_shows", "characters"
  add_foreign_key "video_games", "characters"
end
