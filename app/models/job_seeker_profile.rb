class JobSeekerProfile < ApplicationRecord
  mount_uploader :resume, ResumeUploader

  enum gender: [:female, :male]

  belongs_to :user

  validates_presence_of :date_of_birth, :county,
                        :career_objectives, :interests_and_hobbies, :education

  validates :zipcode, presence: true, numericality: true
end
