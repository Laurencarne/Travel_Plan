class Review < ApplicationRecord
  has_many :likes
  belongs_to :activity
  belongs_to :user

  def self.sort_highest
    self.all.sort_by{|review| review.rating}.reverse[0 ... 10]
  end

  def self.top_countries
    tc = TripCountry.all.map{|a| a.country_id}.sort
    tc.inject(Hash.new(0)) { |country_id, count| country_id[count] += 1; country_id}.max_by(3){|country_id,count| count; count}.map { |arr| arr[0]}
  end

end
