class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :masqueradable
  rolify

  has_one :employer_profile
  has_one :jobseeker_profile

  accepts_nested_attributes_for :employer_profile
  accepts_nested_attributes_for :jobseeker_profile

  validates :email, presence: true
  validates :password, confirmation: true, presence: true
  validates :password_confirmation, presence: true

  scope :all_administrators, -> { with_role(:admin) }
  scope :all_employers, -> { includes(:employer_profile).with_role(:employer) }
  scope :all_jobseekers, -> { includes(:jobseeker_profile).with_role(:jobseeker) }

  def full_name
    if has_role? :admin
      "#{first_name} #{last_name}"
    else
      profile.full_name
    end
  end

  def online?
    current_sign_in_at > 30.minutes.ago
  end

  def profile
    has_role?(:jobseeker) ? jobseeker_profile : employer_profile
  end
end
