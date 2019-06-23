class Country < ApplicationRecord
  has_many :activities
  has_many :trip_countries
  has_many :trips, through: :trip_countries



  def self.show_only_continents
    ## Returns and array of continent names
    Country.all.map{|country| country.continent}.uniq
  end

  def self.continent_image(continent_name)
    ## Returns the URL of continent_image
    Country.all.select{|country| country.continent.downcase == continent_name.downcase}.map{|a| a.continent_image}.uniq.join
  end

  def self.continent_information(continent_name)
    Country.all.select{|country| country.continent.downcase == continent_name.downcase}.map{|a| a.continent_info}.uniq.join
  end

  def self.country_information(country_name)
    Country.all.select{|country| country.name.downcase == country_name.downcase}.map{|a| a.continent_info}.uniq.join
  end

  def self.selected_continents(continent_name)
    ## Returns an array of country names from selected continent
    Country.all.select{|country| country.continent == continent_name}.map{|ind_country| ind_country.name}.uniq
  end

  def self.country_image(country_name)
    ## Returns the URL of country_image
    save = Country.all.select{|country| country.name == country_name}
    save.map{|country| country.country_image}.join
  end

  def self.search(search)
    where("name ILIKE ?", "%#{search}%")
  end



end
