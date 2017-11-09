class JobListingsController < ApplicationController
  def index
    @job_listings = current_user.job_listings
  end

  def new
    @job_listing = current_user.job_listings.build
  end

  def create
    @job_listing = current_user.job_listings.build(job_listing_params)

    if @job_listing.save
      redirect_to job_listings_path, flash: { success: 'Your job listing was successfully created.' }
    else
      render :new
    end
  end

  private

  def job_listing_params
    params.require(:job_listing).permit(
      :title,
      :category,
      :duties_and_responsibilities,
      :age_group,
      :status,
      :number_of_openings,
      :employment_term,
      :hours_per_week,
      :flex_schedule,
      :travel_required,
      :how_to_apply,
      :compensation_type,
      :compensation_amount,
      :medical,
      :dental,
      :vacation,
      :holidays,
      :education,
      :dress_code,
      :dress_code_other,
      :education_requirements,
      :specialized_training,
      :amount_of_experience,
      :specialized_experience,
      :typing_speed,
      :license_requirements
    )
  end
end
