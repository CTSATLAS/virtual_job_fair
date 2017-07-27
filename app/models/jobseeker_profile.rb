class JobseekerProfile < ApplicationRecord
  belongs_to :user

  validates_presence_of :first_name, :last_name, :date_of_birth, :county
  validates :zipcode, presence: true, numericality: true
end
