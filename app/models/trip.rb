class Trip < ApplicationRecord
  belongs_to :user
  has_many :trip_countries
  has_many :countries, through: :trip_countries
  has_many :activities, through: :countries
  has_many :reviews, through: :activities



end
