class TalksController < ApplicationController
  load_and_authorize_resource
  before_filter :authorize, only: [:edit, :update, :destroy]
  before_action :set_talk, only: [:show, :edit, :update, :destroy]

  def approve
    @talk = Talk.find(params[:id])
    @talk.approve
    redirect_to talks_path
  end

  def reject
    @talk = Talk.find(params[:id])
    @talk.reject
    redirect_to talks_path
  end

  def delay
    @talk = Talk.find(params[:id])
    @talk.delay
    redirect_to talks_path
  end

  def index
    @users = User.all
    if params[:tag]
      @talks = Talk.tagged_with(params[:tag])
    else
      @talks = Talk.all
    end
  end

  def show
  end

  def new
    @talk = Talk.new
  end

  def create
    @talk = current_user.talks.new(talk_params)
    respond_to do |format|
      if @talk.save
        # TalkMailer.talk_created(@user).deliver_later
        format.html { redirect_to talks_path, notice:  "You have added a new talk. Good for you!!" }
        format.json { render :show, status: :created, location: @talk }
      else
        format.html { render :new }
        format.json { render json: @talk.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @talks = Talk.all
    if current_user.role == "coder" && @talk.state != "pending"
      redirect_to talks_path, :alert => "You are not authorized to perform that action."
    else
      @talk = @talks.find(params[:id])
    end
  end

  def update
    respond_to do |format|
      if @talk.update(talk_params)
        format.html { redirect_to talks_path, notice: 'Talk was successfully updated.' }
        format.json { render :show, status: :ok, location: @talk }
      else
        format.html { render :edit }
        format.json { render json: @talk.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if current_user.role == "coder" && @talk.state != "pending"
      redirect_to talks_path, :alert => "You are not authorized to perform that action."
    else
      @talk.destroy
      respond_to do |format|
        format.html { redirect_to talks_path, notice: 'Talk was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_talk
    @talk = Talk.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def talk_params
    params.require(:talk).permit(
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
    )
  end
end
