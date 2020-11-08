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

ActiveRecord::Schema.define(version: 2020_11_08_224600) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "exercises", force: :cascade do |t|
    t.string "name"
    t.integer "reps"
    t.integer "sets"
    t.integer "user_id"
    t.boolean "private"
    t.integer "category_id"
    t.integer "muscle_group_id"
    t.integer "workout_exercise_id"
  end

  create_table "muscle_groups", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
  end

  create_table "workout_exercises", force: :cascade do |t|
    t.integer "workout_id"
    t.integer "exercise_id"
    t.integer "reps"
    t.integer "sets"
  end

  create_table "workouts", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.integer "workout_exercise_id"
  end

end
