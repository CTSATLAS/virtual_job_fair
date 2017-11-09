class JobListing < ApplicationRecord
  belongs_to :user

  validates_presence_of :title, :category, :duties_and_responsibilities
end
