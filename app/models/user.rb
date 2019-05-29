class User < ApplicationRecord
  has_many :trips
  has_many :trip_countries, through: :trips
  has_many :countries, through: :trip_countries
  has_many :selected_activities, through: :trip_countries
  has_many :activities, through: :selected_activities
  has_many :reviews, through: :activities
end
