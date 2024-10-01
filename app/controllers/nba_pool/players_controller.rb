class NbaPool::PlayersController < ApplicationController
  before_action :set_nba_pool_player, only: %i[ show edit update destroy ]
  skip_before_action :authenticate_league_admin
  skip_before_action :set_league
  skip_before_action :authenticate_user!, only: %i[ index show ]

  # GET /nba_pool/players or /nba_pool/players.json
  def index
    @nba_pool_players = NbaPool::Player.all
  end

  # GET /nba_pool/players/1 or /nba_pool/players/1.json
  def show
  end

  # GET /nba_pool/players/new
  def new
    redirect_back fallback_location: root_path, notice: "You can't manually create an NBA player"
  end

  # GET /nba_pool/players/1/edit
  def edit
    redirect_back fallback_location: root_path, notice: "You can't manually update an NBA player"
  end

  # POST /nba_pool/players or /nba_pool/players.json
  def create
    redirect_back fallback_location: root_path, notice: "You can't manually create an NBA player"
  end

  # PATCH/PUT /nba_pool/players/1 or /nba_pool/players/1.json
  def update
    redirect_back fallback_location: root_path, notice: "You can't manually update an NBA player"
  end

  # DELETE /nba_pool/players/1 or /nba_pool/players/1.json
  def destroy
    redirect_back fallback_location: root_path, notice: "You can't manually delete an NBA player"
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
