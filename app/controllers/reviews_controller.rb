class ReviewsController < ApplicationController
  before_action :authorized

  def index
    if logged_in?
      @reviews = current_user.reviews
    else
    end
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.valid?
      @review.save
      redirect_to review_path(@review)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:review, :rating, :photo, :activity_id, :user_id)
  end
end
