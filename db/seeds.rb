# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts '===== Adding roles ====='

Role.find_or_create_by!(name: 'admin')
Role.find_or_create_by!(name: 'jobseeker')
Role.find_or_create_by!(name: 'employer')

puts '===== Adding default admins ====='

brandon = User.where(email: 'brandonc@ctsfla.com').first_or_create do |user|
  user.first_name = 'Brandon'
  user.last_name = 'Cordell'
  user.password = 'Scuba***'
  user.password_confirmation = 'Scuba***'
end

brandon.add_role :admin unless brandon.has_role? :admin

unless JobseekerProfile.count > 0
  puts '===== No job seekers found. Adding job seekers ====='

  100.times do
    user = User.new
    user.first_name = FFaker::Name.first_name
    user.last_name = FFaker::Name.last_name
    user.email = "#{user.first_name}.#{user.last_name}@example.com"
    user.password = 'asd123'
    user.password_confirmation = 'asd123'
    user.current_sign_in_at = DateTime.now
    user.last_sign_in_at = DateTime.now

    user.build_jobseeker_profile(
      date_of_birth: Date.today - rand(365*70) - 16*365,
      address_1: FFaker::AddressUS.street_address,
      city: FFaker::AddressUS.city,
      county: 'Hernando',
      state: FFaker::AddressUS.state_abbr,
      zipcode: FFaker::AddressUS.zip_code[0..4],
      phone_number: "(#{FFaker::PhoneNumber.area_code}) #{FFaker::PhoneNumber.exchange_code}-#{rand(1001..9999)}",
      gender: FFaker::Gender.random,
      career_objectives: FFaker::HipsterIpsum.paragraph,
      interests_and_hobbies: 'computers,testing,programming',
      education: ['Did not complete High School', 'High School/GED', 'Some College', "Associate's Degree", "Bachelor's Degree", 'Masters Degree', 'Doctoral Degree'].sample,
      currently_enrolled_in_school: FFaker::Boolean.random,
      currently_employed: FFaker::Boolean.random,
      volunteer_experience: FFaker::HipsterIpsum.paragraph
    )

    user.save!
    user.add_role :jobseeker
  end
end
