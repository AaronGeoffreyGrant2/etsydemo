class PlatformgamesController < ApplicationController
  before_action :set_platformgame, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:index, :show, :new, :edit, :create, :edit, :update, :destroy]
  before_filter :check_user2, only: [:show]
  before_filter :check_user3, only: [:edit, :update]
  before_filter :check_user4, only: [:destroy]

  # GET /platformgames
  # GET /platformgames.json
  def index
    @platformgames = Platformgame.where(user: current_user).order("created_at DESC")
  end

  # GET /platformgames/1
  # GET /platformgames/1.json
  def show
  end

  # GET /platformgames/new
  def new
    @platformgame = Platformgame.new
  end

  # GET /platformgames/1/edit
  def edit
  end

  # POST /platformgames
  # POST /platformgames.json
  def create
    @platformgame = Platformgame.new(platformgame_params)
    @platformgame.user_id = current_user.id

    respond_to do |format|
      if @platformgame.save
        format.html { redirect_to @platformgame, notice: 'Platformgame was successfully created.' }
        format.json { render :show, status: :created, location: @platformgame }
      else
        format.html { render :new }
        format.json { render json: @platformgame.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /platformgames/1
  # PATCH/PUT /platformgames/1.json
  def update
    respond_to do |format|
      if @platformgame.update(platformgame_params)
        format.html { redirect_to @platformgame, notice: 'Platformgame was successfully updated.' }
        format.json { render :show, status: :ok, location: @platformgame }
      else
        format.html { render :edit }
        format.json { render json: @platformgame.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /platformgames/1
  # DELETE /platformgames/1.json
  def destroy
    @platformgame.destroy
    respond_to do |format|
      format.html { redirect_to platformgames_url, notice: 'Platformgame was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_platformgame
      @platformgame = Platformgame.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def platformgame_params
      params.require(:platformgame).permit(:user_id, :player, :playerdies, :playerbeatslevel, :coin, :lava, :enemy, :levelplatform, :levelbackground)
    end

    def check_user2
      if current_user != @platformgame.user
       redirect_to root_url, alert: "Sorry, you can not play this platformgame because it doesn't belong to you!"
      end
    end

    def check_user3
      if current_user != @platformgame.user
       redirect_to root_url, alert: "Hey, you CAN'T change platformgames games that are not yours!"
      end
    end

    def check_user4
      if current_user != @platformgame.user
       redirect_to root_url, alert: "The platformgame won't delete because it's not yours to delete!"
      end
    end
end
