class LikesController < ApplicationController
  before_action :set_like, only: [:show, :edit, :update, :destroy]
  def new
    @like = Like.new

  end

  def create
    @like = Like.new(like_params)
    if @like.valid?
      @like.save
      redirect_to activity_path(params[:activity_id])
    else
      render :new
    end
  end

  # def edit
  # end
  #
  # def update
  #   if @like.update(like_params)
  #     redirect_to like_path(@like)
  #   else
  #     render :edit
  #   end
  # end
  #
  # def destroy
  #   @like.destroy
  #   redirect_to likes_path
  # end

  private

  def like_params
    params.require(:like).permit(:review_id)
  end

  def set_like
    @like = Like.find(params[:id])
  end
end
