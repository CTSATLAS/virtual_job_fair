class CreateJobseekerProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :jobseeker_profiles do |t|
      t.references :user, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :county
      t.string :state
      t.string :zipcode

      t.timestamps
    end
  end
end
