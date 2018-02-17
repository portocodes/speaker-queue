class UsersController < ApplicationController
  def show
    authorize User

    @user = current_user
  end

  def update
    authorize User

    @user = current_user

    if @user.update(user_params)
      if params[:from] == 'new-talk'
        redirect_to new_talk_path, notice: 'Preferences updated.'
      else
        redirect_to root_path, notice: 'Preferences updated.'
      end
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name)
  end
end
