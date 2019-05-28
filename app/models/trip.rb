class Trip < ApplicationRecord
  belongs_to :user
  has_many :trip_countries
  has_many :countries, through: :trip_countries
  has_many :selected_activities, through: :trip_countries



end
