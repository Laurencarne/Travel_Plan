class TripCountriesController < ApplicationController
  before_action :set_trip_country, only: [:show, :edit, :update]
  before_action :authorized

  def index
    @trip_countries = TripCountry.all
  end

  def new
    @trip_country = TripCountry.new
  end

  def create
    @trip_country = TripCountry.new(trip_country_params)
    if @trip_country.valid?
      @trip_country.save
      redirect_to trip_path(@trip_country.trip_id)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @trip_country.update(country_params)
      redirect_to trip_path(@trip_country.trip_id)
    else
      render :edit
    end
  end

  private

  def trip_country_params
    params.require(:trip_country).permit(:country_id, :trip_id)
  end

  def set_trip_country
    @trip_country = TripCountry.find(params[:id])
  end

end
