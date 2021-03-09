class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find(params[:id])

    if user.authenticate
      sessions[:user_id] = user.id 
    else
      flash.now[:error] = "Invalid login credentials"
  end

  def destroy
    reset_session
    render json: { status: 200, logged_out: true }
  end
end
