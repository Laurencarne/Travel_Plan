class TripCountry < ApplicationRecord
  belongs_to :trip
  belongs_to :country
  has_many :activities, through: :countries
end
