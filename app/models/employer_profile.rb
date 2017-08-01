class EmployerProfile < ApplicationRecord
  belongs_to :user

  validates_presence_of :company_name, :city, :state, :zipcode, :contact_first_name, :contact_last_name
  validates :zipcode, presence: true, numericality: true
end
