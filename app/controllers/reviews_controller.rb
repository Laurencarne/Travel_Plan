class ReviewsController < ApplicationController
  before_action :authorized
  skip_before_action :authorized, only: [:show, :new, :create, :destroy]

  def index
    if logged_in?
      @reviews = current_user.reviews
    else
    end
  end

  def new
    @review = Review.new
    @user = current_user.id
  end

  def create
    @review = Review.new(review_params)
    if @review.valid?
      @review.save
      redirect_to activity_path(params[:review][:activity_id])
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    if params[:redirect_to]
      redirect_to reviews_path
    else
      redirect_to activity_path(params[:activity_id])
    end
  end

  private

  def review_params
    params.require(:review).permit(:review, :rating, :photo, :activity_id, :user_id, :title)
  end

end
