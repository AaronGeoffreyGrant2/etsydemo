class ObstacledodgergamesController < ApplicationController
  before_action :set_obstacledodgergame, only: [:show, :edit, :update, :destroy]

  # GET /obstacledodgergames
  # GET /obstacledodgergames.json
  def index
    @obstacledodgergames = Obstacledodgergame.all
  end

  # GET /obstacledodgergames/1
  # GET /obstacledodgergames/1.json
  def show
  end

  # GET /obstacledodgergames/new
  def new
    @obstacledodgergame = Obstacledodgergame.new
  end

  # GET /obstacledodgergames/1/edit
  def edit
  end

  # POST /obstacledodgergames
  # POST /obstacledodgergames.json
  def create
    @obstacledodgergame = Obstacledodgergame.new(obstacledodgergame_params)

    respond_to do |format|
      if @obstacledodgergame.save
        format.html { redirect_to @obstacledodgergame, notice: 'Obstacledodgergame was successfully created.' }
        format.json { render :show, status: :created, location: @obstacledodgergame }
      else
        format.html { render :new }
        format.json { render json: @obstacledodgergame.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /obstacledodgergames/1
  # PATCH/PUT /obstacledodgergames/1.json
  def update
    respond_to do |format|
      if @obstacledodgergame.update(obstacledodgergame_params)
        format.html { redirect_to @obstacledodgergame, notice: 'Obstacledodgergame was successfully updated.' }
        format.json { render :show, status: :ok, location: @obstacledodgergame }
      else
        format.html { render :edit }
        format.json { render json: @obstacledodgergame.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /obstacledodgergames/1
  # DELETE /obstacledodgergames/1.json
  def destroy
    @obstacledodgergame.destroy
    respond_to do |format|
      format.html { redirect_to obstacledodgergames_url, notice: 'Obstacledodgergame was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_obstacledodgergame
      @obstacledodgergame = Obstacledodgergame.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def obstacledodgergame_params
      params.require(:obstacledodgergame).permit(:dodgerimage)
    end
end
