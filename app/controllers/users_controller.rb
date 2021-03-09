class UsersController < ApplicationController
  before_action :require_login, only: [:edit, :update]

  def new
    reset_sessions
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    token = random_string = ('0'..'z').to_a.shuffle.first(8).join
    @user.remember_token = token

    if @user.save
      cookies.permanent[:remember_token] = token
      redirect_to new_user_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to edit_user_path @user
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  private

  def require_login
    user = User.find(sessions[:user_id])

    if user.remember_token.eql? cookies[:remember_token]
      true
    else
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_user_path 
      false
    end
  end
end
