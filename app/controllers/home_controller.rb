class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to talks_path
    end
  end
end
