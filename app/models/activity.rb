class Activity < ApplicationRecord
  belongs_to :country
  has_many :selected_activities
  has_many :reviews
  has_many :likes, through: :reviews
  has_many :trip_countries, through: :selected_activities
  has_many :trips, through: :trip_countries
  has_many :users, through: :reviews



  def self.activities_per_country(country_id)
    self.all.select{|activity| activity.country_id == country_id}
  end

  def self.activities_for_country(country_name)
    self.all.select{|activity| activity.country.name == country_name}
  end

  def activity_review_length
      self.reviews.length
  end

  def activity_review_sum
      all_ratings = self.reviews.map { |review| review.rating }.sum
      
  end

  def average_rating
    if self.activity_review_sum == 0 || self.activity_review_length == 0
        "Awaiting Reviews"
    else
      average = self.activity_review_sum / self.activity_review_length
    end
  end

end
