class UsersController < ApplicationController
  before_action :authorized
  skip_before_action :authorized, only: [:new, :create, :home]


  def home
    @reviews = Review.sort_highest
    @top_countries = Review.top_countries
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to trips_path
    else
      flash[:errors] = ["Please ensure: name is unique & first/last name do not contain numbers or symbols"]
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :first_name, :last_name, :password)
  end

end
