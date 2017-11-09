class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :masqueradable
  rolify

  has_many :job_listings
  has_one :employer_profile
  has_one :jobseeker_profile

  accepts_nested_attributes_for :employer_profile
  accepts_nested_attributes_for :jobseeker_profile

  validates_presence_of :first_name, :last_name, :email

  validates :password, confirmation: true, presence: true, on: :create
  validates :password_confirmation, presence: true, on: :create

  scope :all_administrators, -> { with_role(:admin) }
  scope :all_employers, -> { includes(:employer_profile).with_role(:employer) }
  scope :all_jobseekers, -> { includes(:jobseeker_profile).with_role(:jobseeker) }

  def full_name
    "#{first_name} #{last_name}"
  end

  def online?
    current_sign_in_at > 30.minutes.ago
  end

  def profile
    has_role?(:jobseeker) ? jobseeker_profile : employer_profile
  end

  private

  def password_required?
    new_record? ? super : false
  end
end
