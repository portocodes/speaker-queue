class SessionsController < ApplicationController
  def new
  end

  def create
    UserMailer.login(params[:email]).deliver_now!

    redirect_to root_path, notice: "Email sent to your inbox"
  end

  def login
    email = LoginToken.validate(params[:token])

    if email
      user = User.where(email: email).first_or_create
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged In as a #{user.role}"
    else
      flash.now.alert = "Token is invalid"
      render 'new'
    end

  end

  def destroy
    session[:user_id] = nil
    reset_session
    redirect_to root_path, notice: "You have logged out"
  end
end
