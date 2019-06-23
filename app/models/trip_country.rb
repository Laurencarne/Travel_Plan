class TripCountry < ApplicationRecord
  belongs_to :trip
  belongs_to :country
  has_many :selected_activities
  has_many :activities, through: :countries
  has_many :activities, through: :selected_activities
end
