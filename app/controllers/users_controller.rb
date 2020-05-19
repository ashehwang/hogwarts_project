class UsersController < ApplicationController
    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_param)
        if @user.save
            flash[:notice] = "Created #{@user.full_name}"
            redirect_to user_url(@user.id)
        else 
            render :new
        end 
    end

    def edit
        @user = User.find_by(id: params[:id])
        render :edit
    end

    def update
        @user = User.find_by(id: params[:id])
        if @user.update(user_param)
            redirect_to user_url(@user.id)
        else
            render :edit
        end
    end

    def show
        @user = User.find_by(id: params[:id])
        render :show
    end

    def index
        @users = User.all
        render :index
    end

    def destroy
        @user = User.find_by(id: params[:id])
        if @user.destroy
            flash[:notice] = "Deleted #{@user.name}"
            redirect_to users_url
        end
    end

    private

    def user_param
        params.require(:user).permit(:first_name, :last_name, :house, :age, :description, :gender)
    end
end
