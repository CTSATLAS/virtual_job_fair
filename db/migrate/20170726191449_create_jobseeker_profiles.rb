class CreateJobseekerProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :jobseeker_profiles do |t|
      t.references :user, foreign_key: true
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.date :date_of_birth, null: false
      t.string :address_1, default: nil
      t.string :address_2, default: nil
      t.string :city, default: nil
      t.string :county, null: false
      t.string :state, limit: 2
      t.string :zipcode, limit: 5, null: false
      t.string :phone_number, limit: 15, default: nil
      t.integer :gender, limit: 1, default: 0
      t.text :career_objectives, null: false
      t.string :interests_and_hobbies, null: false
      t.string :education, limit: 28, null: false
      t.boolean :currently_enrolled_in_school, default: :false
      t.boolean :currently_employed, default: :false
      t.text :volunteer_experience
      t.string :resume

      t.timestamps
    end
  end
end
