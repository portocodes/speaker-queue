class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged In as a #{user.role}"
    else
      flash.now.alert = "Email is invalid"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    reset_session
    redirect_to root_path, notice: "You have logged out"
  end
end
