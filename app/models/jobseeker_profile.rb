class JobseekerProfile < ApplicationRecord
  mount_uploader :resume, ResumeUploader

  enum gender: [:female, :male]

  belongs_to :user

  validates_presence_of :first_name, :last_name, :date_of_birth, :county,
                        :career_objectives, :interests_and_hobbies, :education

  validates :zipcode, presence: true, numericality: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
