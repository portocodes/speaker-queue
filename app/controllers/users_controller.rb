class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def update
    @user = current_user

    respond_to do |format|
      if @user.update(user_params)
        format.html {
          if params[:from] == 'new-talk'
            redirect_to new_talk_path, notice: 'Preferences updated.'
          else
            redirect_to root_path, notice: 'Preferences updated.'
          end
        }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(:name)
  end
end
