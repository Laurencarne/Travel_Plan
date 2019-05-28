class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def index
    @trips = Trip.all
  end

  def new
    @trip = Trip.new
  end

  def create
    byebug
    @trip = Trip.new(trip_params)
    if @trip.valid?
      @trip.save
      redirect_to trip_path(@trip)
    else
      byebug
      render :new
    end
  end

  def show
    @countries = Country.all
    @activities = Activity.all
    @tripcountry = TripCountry.all
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
