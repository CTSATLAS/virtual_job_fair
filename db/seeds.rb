# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts '===== Adding default admins ====='

brandon = User.where(email: 'brandonc@ctsfla.com').first_or_create do |user|
  user.first_name = 'Brandon'
  user.last_name = 'Cordell'
  user.password = 'Scuba***'
  user.password_confirmation = 'Scuba***'
end

brandon.save!
brandon.add_role :admin unless brandon.has_role? :admin
