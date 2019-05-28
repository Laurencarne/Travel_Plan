class Activity < ApplicationRecord
  belongs_to :country
  has_many :selected_activities
  has_many :trip_countries, through: :selected_activities
  has_many :trips, through: :trip_countries

  def self.activities_per_country(country_id)
    self.all.select{|activity| activity.country_id == country_id}
  end
end
