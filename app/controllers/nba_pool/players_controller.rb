class NbaPool::PlayersController < ApplicationController
  before_action :set_nba_pool_player, only: %i[ show edit update destroy ]
  skip_before_action :set_league

  # GET /nba_pool/players or /nba_pool/players.json
  def index
    @nba_pool_players = NbaPool::Player.all
  end

  # GET /nba_pool/players/1 or /nba_pool/players/1.json
  def show
  end

  # GET /nba_pool/players/new
  def new
    @nba_pool_player = NbaPool::Player.new
  end

  # GET /nba_pool/players/1/edit
  def edit
  end

  # POST /nba_pool/players or /nba_pool/players.json
  def create
    @nba_pool_player = NbaPool::Player.new(nba_pool_player_params)

    respond_to do |format|
      if @nba_pool_player.save
        format.html { redirect_to nba_pool_player_url(@nba_pool_player), notice: "Player was successfully created." }
        format.json { render :show, status: :created, location: @nba_pool_player }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @nba_pool_player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nba_pool/players/1 or /nba_pool/players/1.json
  def update
    respond_to do |format|
      if @nba_pool_player.update(nba_pool_player_params)
        format.html { redirect_to nba_pool_player_url(@nba_pool_player), notice: "Player was successfully updated." }
        format.json { render :show, status: :ok, location: @nba_pool_player }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @nba_pool_player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nba_pool/players/1 or /nba_pool/players/1.json
  def destroy
    @nba_pool_player.destroy

    respond_to do |format|
      format.html { redirect_to nba_pool_players_url, notice: "Player was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nba_pool_player
      @nba_pool_player = NbaPool::Player.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def nba_pool_player_params
      params.require(:nba_pool_player).permit(:first_name, :last_name, :position, :nba_id, :slug, :draft_year, :nba_team)
    end
end
