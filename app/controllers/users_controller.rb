class UsersController < ApplicationController
    def create
      user = User.new(user_params)
      if user.save
        session[:user_id] = user.id
        render json: user
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def show
        render json: current_user
      end
      
    private
  
    def user_params
      params.require(:user).permit(:username, :password)
    end
  end
  