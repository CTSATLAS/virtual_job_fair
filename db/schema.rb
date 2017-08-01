# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170731202247) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "employer_profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.string "company_name", null: false
    t.text "company_description"
    t.string "address_1"
    t.string "address_2"
    t.string "city", null: false
    t.string "county"
    t.string "state", limit: 2, null: false
    t.string "zipcode", limit: 5, null: false
    t.string "phone_number", limit: 20
    t.string "fax_number", limit: 20
    t.string "website"
    t.string "contact_first_name", null: false
    t.string "contact_last_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_employer_profiles_on_user_id"
  end

  create_table "jobseeker_profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.date "date_of_birth", null: false
    t.string "address_1"
    t.string "address_2"
    t.string "city"
    t.string "county", null: false
    t.string "state", limit: 2
    t.string "zipcode", limit: 5, null: false
    t.string "phone_number", limit: 15
    t.integer "gender", limit: 2, default: 0
    t.text "career_objectives", null: false
    t.string "interests_and_hobbies", null: false
    t.string "education", limit: 28, null: false
    t.boolean "currently_enrolled_in_school", default: false
    t.boolean "currently_employed", default: false
    t.text "volunteer_experience"
    t.string "resume"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_jobseeker_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "employer_profiles", "users"
  add_foreign_key "jobseeker_profiles", "users"
end
