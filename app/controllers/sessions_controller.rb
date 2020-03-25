class SessionsController < ApplicationController
    skip_before_action :logged_in, only: [:new, :create]

    def new
    end
    
    def create
        @current_user = User.find_by(email: params[:session][:email])
      if @current_user && @current_user.authenticate(params[:password])
        session[:user_id] = @current_user.id
        redirect_to markets_path, notice: "Logged in!"
      else
        flash.now[:alert] = "Email or password is invalid"
        render "new"
      end
    end
    
    def destroy
      session[:user_id] = nil
      redirect_to login_path, notice: "Logged out!"
    end
end
  