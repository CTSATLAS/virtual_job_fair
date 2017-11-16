class RenameJobseekerProfilesToJobSeekerProfiles < ActiveRecord::Migration[5.1]
  def change
    rename_table :jobseeker_profiles, :job_seeker_profiles
  end
end
