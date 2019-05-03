class SessionsController < ApplicationController

    # before_action :ensure_logged_in, only: [:destroy]

    def new
        render :new
    end

    def create
        user = User.find_by_credentials(params[:user][:username], params[:user][:password] )
        if user
            log_in!(user)
            redirect_to user_url(user)
        else
            flash.now[:errors] = ["Invalid Username or Password"]
            render :new
        end
    end

    def destroy
        log_out!
        redirect_to new_session_url
    end

end