class UsersController < ApplicationController
  def edit
    @user = current_user
    @talks = @user.talks.where(state: 'pending')
  end

  def update
    respond_to do |format|
      if current_user.update(user_params)
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
