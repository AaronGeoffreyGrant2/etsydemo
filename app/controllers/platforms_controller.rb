class PlatformsController < ApplicationController
  before_action :set_platform, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_filter :check_user2, only: [:show]
  before_filter :check_user3, only: [:edit, :update]
  before_filter :check_user4, only: [:destroy]

  # GET /platforms
  # GET /platforms.json
  def index
    @platforms = Platform.all
  end

  # GET /platforms/1
  # GET /platforms/1.json
  def show
  end

  # GET /platforms/new
  def new
    @platform = Platform.new
  end

  # GET /platforms/1/edit
  def edit
  end

  # POST /platforms
  # POST /platforms.json
  def create
    @platform = Platform.new(platform_params)
    @platform.user_id = current_user.id

    respond_to do |format|
      if @platform.save
        format.html { redirect_to @platform, notice: 'Platform was successfully created.' }
        format.json { render :show, status: :created, location: @platform }
      else
        format.html { render :new }
        format.json { render json: @platform.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /platforms/1
  # PATCH/PUT /platforms/1.json
  def update
    respond_to do |format|
      if @platform.update(platform_params)
        format.html { redirect_to @platform, notice: 'Platform was successfully updated.' }
        format.json { render :show, status: :ok, location: @platform }
      else
        format.html { render :edit }
        format.json { render json: @platform.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /platforms/1
  # DELETE /platforms/1.json
  def destroy
    @platform.destroy
    respond_to do |format|
      format.html { redirect_to platforms_url, notice: 'Platform was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_platform
      @platform = Platform.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def platform_params
      params.require(:platform).permit(:Game, :user_id, :player, :coin, :lava, :enemy_1, :enemy_2, :enemy_3)
    end

    def check_user2
      if current_user != @platform.user
       redirect_to root_url, alert: "You can't play this platform game because it's not yours! In order to play a platform game you need to first buy an image from the market place and then click on create new platform game."
      end
    end

     def check_user3
      if current_user != @platform.user
       redirect_to root_url, alert: "Hey, you CAN'T change platform games that are not yours!"
      end
    end

     def check_user4
      if current_user != @platform.user
       redirect_to root_url, alert: "The platform game won't delete because it's not yours to delete!"
      end
    end
end
