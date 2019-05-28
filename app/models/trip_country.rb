class TripCountry < ApplicationRecord
  belongs_to :trip
  belongs_to :country
  has_many :activities, through: :countries
  has_many :reviews, through: :activities
end
