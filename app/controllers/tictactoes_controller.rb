class TictactoesController < ApplicationController
  before_action :set_tictacto, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_filter :check_user2, only: [:show]
  before_filter :check_user3, only: [:edit, :update]
  before_filter :check_user4, only: [:destroy]

  # GET /tictactoes
  # GET /tictactoes.json
  def index
    @tictactoes = Tictactoe.all
  end

  # GET /tictactoes/1
  # GET /tictactoes/1.json
  def show
  end

  # GET /tictactoes/new
  def new
    @tictacto = Tictactoe.new
  end

  # GET /tictactoes/1/edit
  def edit
  end

  # POST /tictactoes
  # POST /tictactoes.json
  def create
    @tictacto = Tictactoe.new(tictacto_params)
    @tictacto.user_id = current_user.id

    respond_to do |format|
      if @tictacto.save
        format.html { redirect_to @tictacto, notice: 'Tictactoe was successfully created.' }
        format.json { render :show, status: :created, location: @tictacto }
      else
        format.html { render :new }
        format.json { render json: @tictacto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tictactoes/1
  # PATCH/PUT /tictactoes/1.json
  def update
    respond_to do |format|
      if @tictacto.update(tictacto_params)
        format.html { redirect_to @tictacto, notice: 'Tictactoe was successfully updated.' }
        format.json { render :show, status: :ok, location: @tictacto }
      else
        format.html { render :edit }
        format.json { render json: @tictacto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tictactoes/1
  # DELETE /tictactoes/1.json
  def destroy
    @tictacto.destroy
    respond_to do |format|
      format.html { redirect_to tictactoes_url, notice: 'Tictactoe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tictacto
      @tictacto = Tictactoe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tictacto_params
      params.require(:tictacto).permit(:Game, :user_id, :xs, :os)
    end

    def check_user2
      if current_user != @tictacto.user
       redirect_to root_url, alert: "You can't play this tictactoe game because it's not yours! In order to play a platform game you need to first buy an image from the market place and then click on create new platform game."
      end
    end

     def check_user3
      if current_user != @tictacto.user
       redirect_to root_url, alert: "Hey, you CAN'T change tictactoe games that are not yours!"
      end
    end

     def check_user4
      if current_user != @tictacto.user
       redirect_to root_url, alert: "The tictactoe game won't delete because it's not yours to delete!"
      end
    end
end
