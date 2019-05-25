class Country < ApplicationRecord
  has_many :activities
  has_many :trip_countries
  has_many :trips, through: :trip_countries
  has_many :users, through: :trips

  def self.all_continents(continent_name)
    Country.all.select{|country| country.continent.downcase == continent_name}
  end

  def self.sort_by_continent(continent_name)
    Country.all_continents(continent_name).map{|one| one.name}
  end

  def self.show_only_continents
    Country.all.map{|country| country.continent}.uniq
  end

  def self.continent_image(continent_name)
    Country.all_continents(continent_name).map{|c| c.continent_image}
  end
end
