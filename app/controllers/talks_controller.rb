class TalksController < ApplicationController
  before_action :authenticate_user!
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

  # GET /talks
  # GET /talks.json
  def index
    @talks = Talk.all
  end

  # GET /talks/1
  # GET /talks/1.json
  def show
  end

  # GET /talks/new
  def new
    @talk = Talk.new
  end

  # GET /talks/1/edit
  def edit
    @talks = Talk.all
    @talk = @talks.find(params[:id])
  end

  # POST /talks
  # POST /talks.json
  def create
    @user = current_user
    @talk = @user.talks.new(talk_params)
    respond_to do |format|
      if @talk.save
        TalkMailer.talk_created(@user).deliver_later
        format.html { redirect_to talks_path, notice:  "You have added a new talk. Good for you!!" }
        format.json { render :show, status: :created, location: @talk }
      else
        format.html { render :new }
        format.json { render json: @talk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /talks/1
  # PATCH/PUT /talks/1.json
  def update
    respond_to do |format|
      if @talk.update(talk_params)
        format.html { redirect_to @talk, notice: 'Talk was successfully updated.' }
        format.json { render :show, status: :ok, location: @talk }
      else
        format.html { render :edit }
        format.json { render json: @talk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /talks/1
  # DELETE /talks/1.json
  def destroy
    @talk.destroy
    respond_to do |format|
      format.html { redirect_to talks_url, notice: 'Talk was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_talk
      @talk = Talk.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def talk_params
      params.require(:talk).permit(:title, :description, :duration, :speaker, :state)
    end
end
