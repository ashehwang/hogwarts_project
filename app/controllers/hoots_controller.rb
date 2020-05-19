class HootsController < ApplicationController

    def new
        render :new
    end

    def create
        @hoot = Hoot.new(hoot_params)
        @hoot.author_id = current_user.id
        @hoot.save
        redirect_to user_url(current_user)       
    end

    def index
    end

    def show
    end

    def destroy
        @hoot = Hoot.find(params[:hoot][:id])
        if @hoot.destroy
            redirect_to user_url(current_user)
        end 
    end

    def hoot_params
        params.require(:hoot).permit(:body, :parent_hoot_id, :id)
    end
end
