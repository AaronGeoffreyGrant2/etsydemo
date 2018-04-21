class TictactoegamesController < ApplicationController
  before_action :set_tictactoegame, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:index, :show, :new, :edit, :create, :edit, :update, :destroy]
  before_filter :check_user2, only: [:show]
  before_filter :check_user3, only: [:edit, :update]
  before_filter :check_user4, only: [:destroy]

  # GET /tictactoegames
  # GET /tictactoegames.json
  def index
    @tictactoegames = Tictactoegame.where(user: current_user).order("created_at DESC")
  end

  # GET /tictactoegames/1
  # GET /tictactoegames/1.json
  def show
  end

  # GET /tictactoegames/new
  def new
    @tictactoegame = Tictactoegame.new
  end

  # GET /tictactoegames/1/edit
  def edit
  end

  # POST /tictactoegames
  # POST /tictactoegames.json
  def create
    @tictactoegame = Tictactoegame.new(tictactoegame_params)
    @tictactoegame.user_id = current_user.id
    
    respond_to do |format|
      if @tictactoegame.save
        format.html { redirect_to @tictactoegame, notice: 'Tictactoegame was successfully created.' }
        format.json { render :show, status: :created, location: @tictactoegame }
      else
        format.html { render :new }
        format.json { render json: @tictactoegame.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tictactoegames/1
  # PATCH/PUT /tictactoegames/1.json
  def update
    respond_to do |format|
      if @tictactoegame.update(tictactoegame_params)
        format.html { redirect_to @tictactoegame, notice: 'Tictactoegame was successfully updated.' }
        format.json { render :show, status: :ok, location: @tictactoegame }
      else
        format.html { render :edit }
        format.json { render json: @tictactoegame.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tictactoegames/1
  # DELETE /tictactoegames/1.json
  def destroy
    @tictactoegame.destroy
    respond_to do |format|
      format.html { redirect_to tictactoegames_url, notice: 'Tictactoegame was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tictactoegame
      @tictactoegame = Tictactoegame.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tictactoegame_params
      params.require(:tictactoegame).permit(:user_id, :xs, :os)
    end

    def check_user2
      if current_user != @tictactoegame.user
       redirect_to root_url, alert: "Sorry, you can not play this tictactoegame because it doesn't belong to you!"
      end
    end

     def check_user3
      if current_user != @tictactoegame.user
       redirect_to root_url, alert: "Hey, you CAN'T change tictactoegames games that are not yours!"
      end
    end

     def check_user4
      if current_user != @tictactoegame.user
       redirect_to root_url, alert: "The tictactoegame won't delete because it's not yours to delete!"
      end
    end
end
