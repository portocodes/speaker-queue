class PagesController < ApplicationController

  def main
    @users = User.all
    if params[:tag]
      @talks = Talk.tagged_with(params[:tag])
    else
      @talks = Talk.all
    end
  end

  def about_us
  end
end