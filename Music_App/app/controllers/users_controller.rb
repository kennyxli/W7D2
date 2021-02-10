class UsersController < ApplicationController
    def show
        user= User.find(params[:id])
        render json: user
    end
    
    def new
        @user = User.new
        render :new
    end
    def create
        user = User.new(user_params)

        if user.save!
            login!(user)
            redirect_to user_url(user)
        else
            render json: user.full_messages, status: 422
        end
    end



    private
    def user_params
        params.require(:user).permit(:password, :email)
    end
end
