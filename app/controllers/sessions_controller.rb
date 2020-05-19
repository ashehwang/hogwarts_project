class SessionsController < ApplicationController

    def new
        @user = User.new
        render :new
    end

    def create
        user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if user
            login(user)
            redirect_to users_url
        else
            render json: "Password and username don't match ; please try again."
        end
    end

    def destroy
        logout
        redirect_to users_url
    end

end
