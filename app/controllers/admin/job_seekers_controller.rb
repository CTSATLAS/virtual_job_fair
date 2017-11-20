module Admin
  class JobSeekersController < BaseController
    load_and_authorize_resource class: User

    def index
      @job_seekers = JobSeekerProfile.includes(:user).all
    end

    def edit
      @job_seeker = User.find(params[:id])
    end

    def update
      job_seeker = User.find(params[:id])

      if job_seeker.update_attributes(job_seeker_params)
        redirect_to admin_job_seekers_path
      else
        render :edit
      end
    end

    private

    def job_seeker_params
      params.require(:user).permit(
          :email,
          :password,
          :password_confirmation,
          :first_name,
          :last_name,
          job_seeker_profile_attributes: [
              :id,
              :gender,
              :date_of_birth,
              :address_1,
              :address_2,
              :city,
              :county,
              :state,
              :zipcode,
              :phone_number,
              :career_objectives,
              :interests_and_hobbies,
              :education,
              :currently_enrolled_in_school,
              :currently_employed,
              :volunteer_experience,
              :resume
          ]
      )
    end
  end
end
