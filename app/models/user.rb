class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_one :jobseeker_profile
  accepts_nested_attributes_for :jobseeker_profile

  validates :email, presence: true
  validates :password, confirmation: true, presence: true
  validates :password_confirmation, presence: true
end
