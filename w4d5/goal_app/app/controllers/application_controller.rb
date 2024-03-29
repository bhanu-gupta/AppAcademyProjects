class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def log_in!(user)
        session[:session_token] = user.reset_session_token!
        @current_user = user
    end

    def logged_in?
        !!current_user
    end

    def log_out!
        current_user.reset_session_token!
        session[:session_token] = nil
        @current_user = nil
    end

    def ensure_logged_in
        redirect_to users_url unless logged_in?
    end
end
