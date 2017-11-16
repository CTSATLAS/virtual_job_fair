module Admin
  class DashboardController < BaseController
    authorize_resource class: false

    def index
      @job_seeker_count = JobseekerProfile.count
      @employer_count = EmployerProfile.count
      @job_listing_count = JobListing.count
      @latest_job_seekers = User.includes(:jobseeker_profile).with_role(:jobseeker).limit(5).order('id DESC')
      @latest_employers = User.includes(:employer_profile).with_role(:employer).limit(5).order('id DESC')
    end
  end
end
