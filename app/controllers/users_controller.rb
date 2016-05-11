class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all unless current_user
  end

  def show
  end

  def new
    @user = User.new
  end

  def submit
    @user ||= User.new
    @talk = @user.talks.build
  end


  def edit
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id unless current_user
        format.html { redirect_to root_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_url_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email,:role, :avatar, :remote_avatar_url, :remove_avatar,
                                   talks_attributes: [
                                    :user_id,
                                    :id,
                                    :title,
                                    :description,
                                    :duration,
                                    :month,
                                    :speaker,
                                    :state,
                                    :tag_list,
                                    :video,
                                    :resource,
                                    :time_event,
                                    :talk_date,
                                    :talk_time,
                                    :location_name,
                                    :location_coordinates
                                    ]
                                  )
    end
end
