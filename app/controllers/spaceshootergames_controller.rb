class SpaceshootergamesController < ApplicationController
  before_action :set_spaceshootergame, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:index, :show, :new, :edit, :create, :edit, :update, :destroy]

  # GET /spaceshootergames
  # GET /spaceshootergames.json
  def index
    @spaceshootergames = Spaceshootergame.where(user: current_user).order("created_at DESC")
  end

  # GET /spaceshootergames/1
  # GET /spaceshootergames/1.json
  def show
  end

  # GET /spaceshootergames/new
  def new
    @spaceshootergame = Spaceshootergame.new
  end

  # GET /spaceshootergames/1/edit
  def edit
  end

  # POST /spaceshootergames
  # POST /spaceshootergames.json
  def create
    @spaceshootergame = Spaceshootergame.new(spaceshootergame_params)
    @spaceshootergame.user_id = current_user.id

    respond_to do |format|
      if @spaceshootergame.save
        format.html { redirect_to @spaceshootergame, notice: 'Spaceshootergame was successfully created.' }
        format.json { render :show, status: :created, location: @spaceshootergame }
      else
        format.html { render :new }
        format.json { render json: @spaceshootergame.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spaceshootergames/1
  # PATCH/PUT /spaceshootergames/1.json
  def update
    respond_to do |format|
      if @spaceshootergame.update(spaceshootergame_params)
        format.html { redirect_to @spaceshootergame, notice: 'Spaceshootergame was successfully updated.' }
        format.json { render :show, status: :ok, location: @spaceshootergame }
      else
        format.html { render :edit }
        format.json { render json: @spaceshootergame.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spaceshootergames/1
  # DELETE /spaceshootergames/1.json
  def destroy
    @spaceshootergame.destroy
    respond_to do |format|
      format.html { redirect_to spaceshootergames_url, notice: 'Spaceshootergame was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spaceshootergame
      @spaceshootergame = Spaceshootergame.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spaceshootergame_params
      params.require(:spaceshootergame).permit(:user_id, :ship, :enemy)
    end
end
