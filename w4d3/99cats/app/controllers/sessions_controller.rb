class SessionsController < ApplicationController

    before_action :ensure_logged_in, only:[:destroy]

    def new
        render :new
    end
    
    def create
        user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])
        if user
            #login!
            login_user!(user)
            redirect_to cats_url
        else
            flash.now[:errors] = ["Invalid Username or Password"]
            render :new
        end
    end

    def destroy
        current_user.reset_session_token! unless current_user.nil?
        session[:session_token] = nil
        redirect_to cats_url
    end
end