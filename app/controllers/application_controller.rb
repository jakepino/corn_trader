class ApplicationController < ActionController::Base
    before_action :current_user
    before_action :logged_in

    def current_user
        if session[:user_id]
            @current_user ||= User.find(session[:user_id])
        else
            @current_user = nil
        end
    end

    def logged_in
        if @current_user
        else
            redirect_to login_path
        end
    end
end
