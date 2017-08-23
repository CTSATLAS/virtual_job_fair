class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  rolify

  has_one :employer_profile
  has_one :jobseeker_profile

  accepts_nested_attributes_for :employer_profile
  accepts_nested_attributes_for :jobseeker_profile

  validates :email, presence: true
  validates :password, confirmation: true, presence: true
  validates :password_confirmation, presence: true

  scope :all_employers, -> { with_role(:employer) }
  scope :all_jobseekers, -> { with_role(:jobseeker) }

  delegate :full_name, to: :profile

  def online?
    current_sign_in_at > 30.minutes.ago
  end

  def profile
    has_role?(:jobseeker) ? jobseeker_profile : employer_profile
  end
end
