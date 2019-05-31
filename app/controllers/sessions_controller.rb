class SessionsController < ApplicationController
  before_action :authorized
  skip_before_action :authorized, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to trips_path
    else
      flash[:errors] = ["Those details don't match. Please try again."]
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to home_path
  end
end
