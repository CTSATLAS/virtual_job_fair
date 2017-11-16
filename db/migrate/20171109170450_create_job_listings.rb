class CreateJobListings < ActiveRecord::Migration[5.1]
  def change
    create_table :job_listings do |t|
      t.belongs_to :user, foreign_key: true
      t.string :title
      t.string :category
      t.text :duties_and_responsibilities
      t.string :age_group
      t.integer :status
      t.integer :number_of_openings
      t.string :employment_term
      t.integer :hours_per_week
      t.boolean :flex_schedule
      t.boolean :travel_required
      t.text :how_to_apply
      t.string :compensation_type
      t.string :compensation_amount
      t.boolean :medical
      t.boolean :dental
      t.boolean :vacation
      t.boolean :holidays
      t.boolean :education
      t.string :dress_code
      t.string :dress_code_other
      t.string :education_requirements
      t.string :specialized_training
      t.string :amount_of_experience
      t.string :specialized_experience
      t.integer :typing_speed
      t.string :license_requirements

      t.timestamps
    end
  end
end
