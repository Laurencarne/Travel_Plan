class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]
  before_action :authorized

  def index
    @trips = Trip.all
    if logged_in?
      @trips = current_user.trips
    else
    end
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.valid?
      @trip.save
      redirect_to trip_path(@trip)
    else
      render :new
    end
  end

  def show
    @countries = @trip.countries
    @page_hash = {}
    @countries.each{|country| @page_hash[country.name] = []}
    @trip.selected_activities.each{|sa| @page_hash[sa.trip_country.country.name] << sa.activity}
    @trip_country = TripCountry.new
    @selected_activity = SelectedActivity.new
  end

  def edit
  end

  def update
    if @trip.update(trip_params)
      redirect_to trip_path(@trip)
    else
      render :edit
    end
  end

  def destroy
    @trip.destroy
    redirect_to trips_path
  end

  private

  def trip_params
    params.require(:trip).permit(:name, :start_date, :end_date, :travel_companions, :published, :notes, :trip_id)
  end

  def set_trip
    @trip = Trip.find(params[:id])
  end
end
