class PagesController < ApplicationController

  def landing
    @users = User.all
    @tags = Talk.all.map {|t| t.tag_list}.flatten.uniq
    if params[:tag]
      @talks = Talk.tagged_with(params[:tag])
    else
      @talks = Talk.all
    end
  end

  def about_us
  end
end
