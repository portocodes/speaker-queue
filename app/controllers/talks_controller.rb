class TalksController < ApplicationController
  def index
    authorize Talk

    @presented_talks = Talk.presented.order(:created_at)
    @proposed_talks = Talk.proposed.order(:created_at)
  end

  def show
    @talk = Talk.find(params[:id])
    authorize @talk
  end

  def new
    authorize Talk

    if !current_user
      flash[:notice] = "Please login before submitting a talk"
      redirect_to new_session_path
    elsif current_user.name.blank?
      flash[:notice] = "Please add a name"
      redirect_to preferences_path(from: 'new-talk')
    end

    @talk = Talk.new
  end

  def create
    authorize Talk

    @talk = current_user.talks.new(talk_params)

    if @talk.save
      TalkMailer.talk_created(@talk).deliver!

      redirect_to talks_path, notice:  "You have added a new talk. Good for you!!"
    else
      render :new
    end
  end

  def edit
    @talk = Talk.find(params[:id])
    authorize @talk
  end

  def update
    @talk = Talk.find(params[:id])
    authorize @talk

    if @talk.update(talk_params)
      redirect_to talks_path, notice: 'Talk was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @talk = Talk.find(params[:id])
    authorize @talk

    if current_user.role == "coder" && @talk.state != "pending"
      redirect_to talks_path, :alert => "You are not authorized to perform that action."
    else
      @talk.destroy
      redirect_to talks_path, notice: 'Talk was successfully destroyed.'
    end
  end

  private

  def talk_params
    params.require(:talk).permit(
      :title,
      :description,
      :kind
    )
  end
end
