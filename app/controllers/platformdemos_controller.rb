class PlatformdemosController < ApplicationController
  before_action :set_platformdemo, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_filter :check_user2, only: [:show]
  before_filter :check_user3, only: [:edit, :update]
  before_filter :check_user4, only: [:destroy]

  # GET /platformdemos
  # GET /platformdemos.json
  def index
    @platformdemos = Platformdemo.all
  end

  # GET /platformdemos/1
  # GET /platformdemos/1.json
  def show
  end

  # GET /platformdemos/new
  def new
    @platformdemo = Platformdemo.new
  end

  # GET /platformdemos/1/edit
  def edit
  end

  # POST /platformdemos
  # POST /platformdemos.json
  def create
    @platformdemo = Platformdemo.new(platformdemo_params)
    @platformdemo.user_id = current_user.id

    respond_to do |format|
      if @platformdemo.save
        format.html { redirect_to @platformdemo, notice: 'Platformdemo was successfully created.' }
        format.json { render :show, status: :created, location: @platformdemo }
      else
        format.html { render :new }
        format.json { render json: @platformdemo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /platformdemos/1
  # PATCH/PUT /platformdemos/1.json
  def update
    respond_to do |format|
      if @platformdemo.update(platformdemo_params)
        format.html { redirect_to @platformdemo, notice: 'Platformdemo was successfully updated.' }
        format.json { render :show, status: :ok, location: @platformdemo }
      else
        format.html { render :edit }
        format.json { render json: @platformdemo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /platformdemos/1
  # DELETE /platformdemos/1.json
  def destroy
    @platformdemo.destroy
    respond_to do |format|
      format.html { redirect_to platformdemos_url, notice: 'Platformdemo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_platformdemo
      @platformdemo = Platformdemo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def platformdemo_params
      params.require(:platformdemo).permit(:Demo, :user_id, :player, :coin, :lava, :enmey)
    end

    def check_user2
      if current_user != @platformdemo.user
       redirect_to root_url, alert: "You can only play the platformdemos that you make. To make one click on create new platformdemo."
      end
    end

     def check_user3
      if current_user != @platformdemo.user
       redirect_to root_url, alert: "Hey, you CAN'T edit platformdemo games that are not yours!"
      end
    end

     def check_user4
      if current_user != @platformdemo.user
       redirect_to root_url, alert: "The platformdemo game won't delete because it's not yours to delete!"
      end
    end
end
