module Admin
  class JobseekersController < BaseController
    load_and_authorize_resource class: User

    def index
      @jobseekers = User.all_jobseekers
    end

    def edit
      @jobseeker = User.find(params[:id])
    end

    def update
      jobseeker = User.find(params[:id])

      if jobseeker.update_attributes(jobseeker_params)
        redirect_to admin_jobseekers_path
      else
        render :edit
      end
    end

    private

    def jobseeker_params
      params.require(:user).permit(
          :email,
          :password,
          :password_confirmation,
          :first_name,
          :last_name,
          jobseeker_profile_attributes: [
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
