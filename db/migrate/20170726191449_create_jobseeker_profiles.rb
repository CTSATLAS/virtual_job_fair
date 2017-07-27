class CreateJobseekerProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :jobseeker_profiles do |t|
      t.references :user, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :address_1, default: nil
      t.string :address_2, default: nil
      t.string :city, default: nil
      t.string :county
      t.string :state, limit: 2
      t.string :zipcode, limit: 5
      t.string :phone_number, limit: 15, default: nil

      t.timestamps
    end
  end
end
