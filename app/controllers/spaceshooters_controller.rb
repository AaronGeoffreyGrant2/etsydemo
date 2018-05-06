class SpaceshootersController < ApplicationController
  before_action :set_spaceshooter, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_filter :check_user2, only: [:show]
  before_filter :check_user3, only: [:edit, :update]
  before_filter :check_user4, only: [:destroy]

  # GET /spaceshooters
  # GET /spaceshooters.json
  def index
    @spaceshooters = Spaceshooter.all
  end

  # GET /spaceshooters/1
  # GET /spaceshooters/1.json
  def show
  end

  # GET /spaceshooters/new
  def new
    @spaceshooter = Spaceshooter.new
  end

  # GET /spaceshooters/1/edit
  def edit
  end

  # POST /spaceshooters
  # POST /spaceshooters.json
  def create
    @spaceshooter = Spaceshooter.new(spaceshooter_params)
    @spaceshooter.user_id = current_user.id

    respond_to do |format|
      if @spaceshooter.save
        format.html { redirect_to @spaceshooter, notice: 'Spaceshooter was successfully created.' }
        format.json { render :show, status: :created, location: @spaceshooter }
      else
        format.html { render :new }
        format.json { render json: @spaceshooter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spaceshooters/1
  # PATCH/PUT /spaceshooters/1.json
  def update
    respond_to do |format|
      if @spaceshooter.update(spaceshooter_params)
        format.html { redirect_to @spaceshooter, notice: 'Spaceshooter was successfully updated.' }
        format.json { render :show, status: :ok, location: @spaceshooter }
      else
        format.html { render :edit }
        format.json { render json: @spaceshooter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spaceshooters/1
  # DELETE /spaceshooters/1.json
  def destroy
    @spaceshooter.destroy
    respond_to do |format|
      format.html { redirect_to spaceshooters_url, notice: 'Spaceshooter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spaceshooter
      @spaceshooter = Spaceshooter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spaceshooter_params
      params.require(:spaceshooter).permit(:Game, :user_id, :playership, :enemyships)
    end
    
    def check_user2
      if current_user != @spaceshooter.user
       redirect_to root_url, alert: "You can't play this spaceshooter game because it's not yours! In order to play a platform game you need to first buy an image from the market place and then click on create new platform game."
      end
    end

     def check_user3
      if current_user != @spaceshooter.user
       redirect_to root_url, alert: "Hey, you CAN'T change spaceshooter games that are not yours!"
      end
    end

     def check_user4
      if current_user != @spaceshooter.user
       redirect_to root_url, alert: "The spaceshooter game won't delete because it's not yours to delete!"
      end
    end
end
