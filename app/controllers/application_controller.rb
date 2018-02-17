class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  after_action :verify_authorized

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
end
