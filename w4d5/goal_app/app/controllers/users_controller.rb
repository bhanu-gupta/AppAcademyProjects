class UsersController < ApplicationController

    # before_action :ensure_logged_in, only: [:show]

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        # debugger
        if @user.save
            # debugger
            log_in!(@user)
            # debugger
            redirect_to user_url(@user)
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def show
        @user = User.find_by(id: params[:id])
        render :show
    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end
end