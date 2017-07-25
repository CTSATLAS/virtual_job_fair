class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  # GET /resource/sign_up
  def new
    build_resource({})
    resource.build_jobseeker_profile
  end

  # POST /resource
  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      params[:account_type] = params[:user][:account_type]
      render :new
    end
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(
        :email,
        :password,
        :password_confirmation,
        jobseeker_profile_attributes: [
          :first_name,
          :last_name,
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
