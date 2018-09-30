class Location < ApplicationRecord
  has_many :job_postings, dependent: :destroy
  has_one :region
  
  validates :name, presence: true
  validates :street_address_1, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
end
