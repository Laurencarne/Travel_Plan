class SelectedActivitiesController < ApplicationController
  before_action :set_selected_activity, only: [:show, :edit, :update, :destroy]
  before_action :authorized

  def index
    @selected_activities = SelectedActivity.all
  end

  def new
    @selected_activity = SelectedActivity.new
  end

  def create
    @selected_activity = SelectedActivity.new(selected_activity_params)
    if @selected_activity.valid?
      @selected_activity.save
      redirect_to trip_path(@selected_activity.trip_country.trip_id)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @selected_activity.update(selected_activity_params)
      redirect_to selected_activity_path(@selected_activity)
    else
      render :edit
    end
  end

  def destroy
    @selected_activity.destroy
    redirect_to selected_activitys_path
  end

  private

  def selected_activity_params
    params.require(:selected_activity).permit(:trip_country_id, :activity_id)
  end

  def set_selected_activity
    @selected_activity = SelectedActivity.find(params[:id])
  end
end
