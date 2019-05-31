class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  before_action :authorized
  skip_before_action :authorized, only: [:index, :show]


  def index
    @activities = Activity.all
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.valid?
      @activity.save
      redirect_to activity_path(@activity)
    else
      render :new
    end
  end

  def show
    @review_id = 
    @reviews = @activity.reviews
    @like = Like.new
    @review = Review.new
    if logged_in?
      @user = current_user.id
    else
    end
  end

  def edit
  end

  def update
    if @activity.update(activity_params)
      redirect_to activity_path(@activity)
    else
      render :edit
    end
  end

  def destroy
    @activity.destroy
    redirect_to activitys_path
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :price, :notes, :street_name, :city, :zip_code, :country_id, :image)
  end

  def set_activity
    @activity = Activity.find(params[:id])
  end
end
