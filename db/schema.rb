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

ActiveRecord::Schema[7.0].define(version: 2024_05_11_082136) do
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

  create_table "alcoholdiaries", force: :cascade do |t|
    t.integer "beer", default: [], array: true
    t.integer "strong", default: [], array: true
    t.integer "jpricewine", default: [], array: true
    t.integer "wine", default: [], array: true
    t.integer "shochu", default: [], array: true
    t.integer "whisky", default: [], array: true
    t.integer "highball", default: [], array: true
    t.string "other"
    t.bigint "diary_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diary_id"], name: "index_alcoholdiaries_on_diary_id"
  end

  create_table "alcohols", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "highball", default: [0, 0, 0], array: true
  end

  create_table "controlstimulus", force: :cascade do |t|
    t.integer "num"
    t.bigint "addicdatum_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addicdatum_id"], name: "index_controlstimulus_on_addicdatum_id"
  end

  create_table "counsellors", force: :cascade do |t|
    t.integer "hospital", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_counsellors_on_user_id"
  end

  create_table "diaries", force: :cascade do |t|
    t.datetime "starttime"
    t.datetime "endtime"
    t.string "place"
    t.string "people"
    t.string "impetus"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "addicdatum_id", null: false
    t.index ["addicdatum_id"], name: "index_diaries_on_addicdatum_id"
  end

  create_table "essayreads", force: :cascade do |t|
    t.integer "num"
    t.bigint "addicdatum_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addicdatum_id"], name: "index_essayreads_on_addicdatum_id"
  end

  create_table "funeventabstracts", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.string "abstract", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_funeventabstracts_on_patient_id"
  end

  create_table "funeventconcretes", force: :cascade do |t|
    t.bigint "funeventabstract_id", null: false
    t.string "concrete", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["funeventabstract_id"], name: "index_funeventconcretes_on_funeventabstract_id"
  end

  create_table "funeventreads", force: :cascade do |t|
    t.bigint "funeventabstract_id", null: false
    t.string "word", array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["funeventabstract_id"], name: "index_funeventreads_on_funeventabstract_id"
  end

  create_table "hospitals", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "imaginations", force: :cascade do |t|
    t.bigint "imaginationtext_id", null: false
    t.integer "autonomicnervesbefore", default: [], array: true
    t.integer "feelingbefore", default: [], array: true
    t.integer "directionbefore", default: [], array: true
    t.integer "drivingforcebefore"
    t.integer "otherbefore", default: [], array: true
    t.string "othertextbefore"
    t.integer "autonomicnervesafter", default: [], array: true
    t.integer "feelingafter", default: [], array: true
    t.integer "directionafter", default: [], array: true
    t.integer "drivingforceafter"
    t.integer "otherafter", default: [], array: true
    t.string "othertextafter"
    t.integer "completion"
    t.integer "interruption"
    t.string "interruptiontext"
    t.integer "post"
    t.string "posttext"
    t.integer "people"
    t.string "peopletext"
    t.string "word", array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imaginationtext_id"], name: "index_imaginations_on_imaginationtext_id"
  end

  create_table "imaginationtexts", force: :cascade do |t|
    t.bigint "addicdatum_id", null: false
    t.text "imaginationtext"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addicdatum_id"], name: "index_imaginationtexts_on_addicdatum_id"
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

  create_table "pseudoacts", force: :cascade do |t|
    t.bigint "addicdatum_id", null: false
    t.integer "autonomicnervesbefore", default: [], array: true
    t.integer "feelingbefore", default: [], array: true
    t.integer "directionbefore", default: [], array: true
    t.integer "drivingforcebefore"
    t.integer "otherbefore", default: [], array: true
    t.string "othertextbefore"
    t.integer "autonomicnervesafter", default: [], array: true
    t.integer "feelingafter", default: [], array: true
    t.integer "directionafter", default: [], array: true
    t.integer "drivingforceafter"
    t.integer "otherafter", default: [], array: true
    t.string "othertextafter"
    t.integer "completion"
    t.integer "interruption"
    t.string "interruptiontext"
    t.integer "post"
    t.string "posttext"
    t.integer "people"
    t.string "peopletext"
    t.integer "timezone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addicdatum_id"], name: "index_pseudoacts_on_addicdatum_id"
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
  add_foreign_key "alcoholdiaries", "diaries"
  add_foreign_key "controlstimulus", "addicdata"
  add_foreign_key "counsellors", "users"
  add_foreign_key "diaries", "addicdata"
  add_foreign_key "essayreads", "addicdata"
  add_foreign_key "funeventabstracts", "patients"
  add_foreign_key "funeventconcretes", "funeventabstracts"
  add_foreign_key "funeventreads", "funeventabstracts"
  add_foreign_key "imaginations", "imaginationtexts"
  add_foreign_key "imaginationtexts", "addicdata"
  add_foreign_key "patients", "users"
  add_foreign_key "pseudoacts", "addicdata"
end
