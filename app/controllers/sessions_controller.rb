class SessionsController < ApplicationController
  def new
    authorize :session
  end

  def create
    authorize :session

    UserMailer.login(params[:email]).deliver_now!

    redirect_to root_path, notice: "Email sent to your inbox"
  end

  def login
    authorize :session

    email = LoginToken.validate(params[:token])

    if email
      user = User.where(email: email).first_or_create
      session[:user_id] = user.id
      redirect_to root_path, notice: "Welcome back!"
    else
      flash.now.alert = "Token is invalid"
      render 'new'
    end

  end

  def destroy
    authorize :session

    session[:user_id] = nil
    reset_session
    redirect_to root_path, notice: "You have logged out"
  end
end
