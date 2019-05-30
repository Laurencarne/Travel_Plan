class Activity < ApplicationRecord
  belongs_to :country
  has_many :selected_activities
  has_many :reviews
  has_many :trip_countries, through: :selected_activities
  has_many :trips, through: :trip_countries
  has_many :users, through: :reviews

  def self.activities_per_country(country_id)
    self.all.select{|activity| activity.country_id == country_id}
  end

  def self.activities_for_country(country_name)
    self.all.select{|activity| activity.country.name == country_name}
  end
end
