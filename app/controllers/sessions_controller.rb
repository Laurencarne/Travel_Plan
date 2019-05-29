class SessionsController < ApplicationController
    before_action :authorized
    skip_before_action :authorized, only: [:new, :create]

    def new
        
    end

    def create
        user = User.find_by(name: params[:name])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to user
        else
            flash[:errors] = ['credentials do not match our db records']
            redirect_to login_path
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to trips_path
      end
end
