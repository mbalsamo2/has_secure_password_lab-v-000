class UsersController < ApplicationController

  def home

    @user = User.find(session[:user_id])
  end

  def new
    @user = User.new
  end

  def create
    if params[:user][:password] == params[:user][:password_confirmation]
      @user = User.create(user_params)
      session[:user_id] = @user.id
  
      redirect_to home_path
    else
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
