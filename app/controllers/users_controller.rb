class UsersController < ApplicationController
  def show
  end

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      log_in user
    else
      render json: user.errors.full_messages
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
