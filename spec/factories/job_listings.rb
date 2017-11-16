FactoryGirl.define do
  factory :job_listing do
    user nil
    title "MyString"
    category "MyString"
    duties_and_responsibilities "MyString"
    age_group "MyString"
    status 1
    number_of_openings 1
    employment_term "MyString"
    hours_per_week 1
    flex_schedule false
    travel_required false
    how_to_apply "MyText"
    compensation_type "MyString"
    compensation_amount "MyString"
    medical false
    dental false
    vacation false
    holidays false
    education false
    dress_code "MyString"
    dress_code_other "MyString"
    education_requirements "MyString"
    specialized_training "MyString"
    amount_of_experience "MyString"
    specialized_experience "MyString"
    typing_speed 1
    license_requirements "MyString"
  end
end
