# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_11_090808) do

  create_table "difficulties", force: :cascade do |t|
    t.string "name", null: false
    t.integer "points", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "name", null: false
    t.text "good_answer", null: false
    t.text "bad_answer1", null: false
    t.text "bad_answer2"
    t.text "bad_answer3"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "quizzs", force: :cascade do |t|
    t.string "title", null: false
    t.integer "difficulty_id", null: false
    t.integer "question_1_id", null: false
    t.integer "question_2_id"
    t.integer "question_3_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "scoreboards", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "quizz_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "login", null: false
    t.text "password_digest", null: false
    t.string "role"
    t.integer "points", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
