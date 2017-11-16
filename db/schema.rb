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

ActiveRecord::Schema.define(version: 20171116153943) do

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

  create_table "events", force: :cascade do |t|
    t.string "title", null: false
    t.string "specialty", null: false
    t.datetime "visible_start", null: false
    t.datetime "visible_end", null: false
    t.datetime "starts_at", null: false
    t.datetime "ends_at", null: false
    t.boolean "allow_late_registration", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ends_at"], name: "index_events_on_ends_at"
    t.index ["starts_at"], name: "index_events_on_starts_at"
    t.index ["visible_end"], name: "index_events_on_visible_end"
    t.index ["visible_start"], name: "index_events_on_visible_start"
  end

  create_table "job_listings", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.string "category"
    t.text "duties_and_responsibilities"
    t.string "age_group"
    t.integer "status"
    t.integer "number_of_openings"
    t.string "employment_term"
    t.integer "hours_per_week"
    t.boolean "flex_schedule"
    t.boolean "travel_required"
    t.text "how_to_apply"
    t.string "compensation_type"
    t.string "compensation_amount"
    t.boolean "medical"
    t.boolean "dental"
    t.boolean "vacation"
    t.boolean "holidays"
    t.boolean "education"
    t.string "dress_code"
    t.string "dress_code_other"
    t.string "education_requirements"
    t.string "specialized_training"
    t.string "amount_of_experience"
    t.string "specialized_experience"
    t.integer "typing_speed"
    t.string "license_requirements"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_job_listings_on_user_id"
  end

  create_table "job_seeker_profiles", force: :cascade do |t|
    t.bigint "user_id"
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
    t.index ["user_id"], name: "index_job_seeker_profiles_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
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
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "employer_profiles", "users"
  add_foreign_key "job_listings", "users"
  add_foreign_key "job_seeker_profiles", "users"
end
