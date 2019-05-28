class Activity < ApplicationRecord
  belongs_to :country
  has_many :reviews

  def self.activities_per_country(country_id)
    self.all.select{|activity| activity.country_id == country_id}
  end
end
