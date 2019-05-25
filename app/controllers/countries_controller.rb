class CountriesController < ApplicationController
  before_action :set_country, only: [:show, :edit, :update, :destroy]

  def index
    @countries = Country.show_only_continents
  end

  def new
    @country = Country.new
  end

  def create
    @country = Country.new(country_params)
    if @country.valid?
      @country.save
      redirect_to country_path(@country)
    else
      render :new
    end
  end

  def show
  end

  def africa
    @africa = Country.sort_by_continent("africa")
  end

  def asia
    @africa = Country.sort_by_continent("asia")
  end

  def europe
    @africa = Country.sort_by_continent("europe")
  end

  def south_america
    @africa = Country.sort_by_continent("south america")
  end

  def north_america
    @africa = Country.sort_by_continent("north america")
  end




  private

  def country_params
    params.require(:country).permit(:name, :informaiton, :language, :flag, :photo, :alpha2)
  end

  def set_country
    @country = Country.find(params[:id])
  end
end
