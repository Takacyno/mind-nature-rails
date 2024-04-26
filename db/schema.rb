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

ActiveRecord::Schema[7.0].define(version: 2024_04_25_074450) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addicdata", force: :cascade do |t|
    t.integer "what", null: false
    t.integer "severity"
    t.string "progress"
    t.string "difficulties"
    t.string "frequency"
    t.string "trouble"
    t.string "method"
    t.string "goal"
    t.string "controlstimulustext"
    t.text "controlstimulusinstruction"
    t.text "pseudoactinstruction"
    t.text "imaginationinstruction"
    t.boolean "essayok"
    t.text "essay"
    t.string "supplement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "patient_id", null: false
    t.index ["patient_id"], name: "index_addicdata_on_patient_id"
  end

  create_table "addictions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "counsellors", force: :cascade do |t|
    t.integer "hospital", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_counsellors_on_user_id"
  end

  create_table "hospitals", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients", force: :cascade do |t|
    t.integer "hospital"
    t.integer "age"
    t.integer "sex"
    t.string "counsellors"
    t.string "residence"
    t.string "rhythmoflife"
    t.string "interests"
    t.string "profession"
    t.string "workexp"
    t.string "harshchildhoodexp"
    t.string "criminalrecord"
    t.string "othertraumas"
    t.string "supplement"
    t.string "goal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.integer "holiday", default: [], array: true
    t.integer "testshow", default: [], array: true
    t.integer "addiction", default: [], array: true
    t.index ["user_id"], name: "index_patients_on_user_id"
  end

  create_table "tests", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "counsellorflag", default: false, null: false
    t.string "password_digest", null: false
    t.string "email", null: false
    t.boolean "userstatus", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "adminflag", default: false, null: false
    t.boolean "directorflag", default: false, null: false
    t.string "userable_type"
    t.bigint "userable_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["userable_type", "userable_id"], name: "index_users_on_userable"
  end

  create_table "weeks", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "addicdata", "patients"
  add_foreign_key "counsellors", "users"
  add_foreign_key "patients", "users"
end
