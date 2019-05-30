class CountriesController < ApplicationController
  before_action :set_country, only: [:show]

  def index
    @countries = Country.show_only_continents
  end

  def show
    @trip_country = TripCountry.new
    if logged_in?
      @trips = current_user.trips
    else
    end
  end

  def africa
    @africa = Country.selected_continents("Africa")

  end

  def asia
    @asia = Country.selected_continents("Asia")
  end

  def europe
    @europe = Country.selected_continents("Europe")
  end

  def south_america
    @south_america= Country.selected_continents("South America")
  end

  def north_america
    @north_america = Country.selected_continents("North America")
  end

  def oceania
    @oceania = Country.selected_continents("Oceania")
  end

  def search
      @countries = Country.all
      if params[:search]
        @countries = Country.search(params[:search]).order("created_at ASC")
      else
        @countries = Country.all.order("created_at ASC")
      end
    end

  private

  def country_params
    params.require(:country).permit(:name, :informaiton, :language, :country_image, :continent_image, :continent_info, :continent)
  end

  def set_country
    @country = Country.find(params[:id])
  end
end
