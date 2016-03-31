class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?, :except => [:destroy]

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |user|
      user.permit({talk: [ :title, :description, :duration, :speaker, :state, :tag_list]})
    end
  end

end
