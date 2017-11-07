class RemoveFirstAndLastNameFromJobseekerProfiles < ActiveRecord::Migration[5.1]
  def change
    remove_column :jobseeker_profiles, :first_name
    remove_column :jobseeker_profiles, :last_name
  end
end
