class CreateEmployerProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :employer_profiles do |t|
      t.references :user, foreign_key: true
      t.string :company_name, null: false
      t.text :company_description
      t.string :address_1
      t.string :address_2
      t.string :city, null: false
      t.string :county
      t.string :state, limit: 2, null: false
      t.string :zipcode, limit: 5, null: false
      t.string :phone_number, limit: 20
      t.string :fax_number, limit: 20
      t.string :website
      t.string :contact_first_name, null: false
      t.string :contact_last_name, null: false

      t.timestamps
    end
  end
end
