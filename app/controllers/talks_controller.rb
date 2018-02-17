class TalksController < ApplicationController
  def index
    @presented_talks = Talk.presented.order(:created_at)
    @proposed_talks = Talk.proposed.order(:created_at)
  end

  def show
    @talk = Talk.find(params[:id])
  end

  def new
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
    @talk = current_user.talks.new(talk_params)

    respond_to do |format|
      if @talk.save
        TalkMailer.talk_created(@talk).deliver!

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

  def talk_params
    params.require(:talk).permit(
      :title,
      :description,
      :kind
    )
  end
end
