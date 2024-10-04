class PlayersController < ApplicationController
  before_action :set_player, only: %i[ show edit update destroy ]
  before_action :authenticate_league_admin, only: %i[ new create edit update destroy ]

  # GET /players or /players.json
  def index
    @players = @league.players
    render json: @players.as_json(include: [:team, :salaries])
  end

  # GET /players/1 or /players/1.json
  def show
    render json: @player.as_json(include: [:team, :salaries])
  end

  # GET /players/new
  def new
    
    #@team = request&.referrer&.match?("/roster") ? request.referrer.split("/")[-2] : nil

  end

  # GET /players/1/edit
  def edit
  end

  # POST /players or /players.json
  def create
    if !params[:nba_player_id]
      render json: {message: "You can only add an existing NBA player", status: :unprocessable_entity }
      return
    else
      @nba_player = NbaPool::Player.find_by(nba_id: params[:nba_player_id])
      @player = @league.players.find_or_initialize_by(nba_id: params[:nba_player_id])
      @player.assign_attributes(
        first_name: @nba_player&.first_name,
        last_name: @nba_player&.last_name,
        position: @nba_player&.position,
        slug: @nba_player&.slug,
        draft_year: @nba_player&.draft_year,
        nba_team: @nba_player&.nba_team,
        team_id: params[:team_id]
      )
    end

    if @player.save
      render json: @player, status: :created
    else
      render json: @player.errors, status: :unprocessable_entity
    end

  end

  # PATCH/PUT /players/1 or /players/1.json
  def update
    if @player.update(player_params)
      render json: @player
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  # DELETE /players/1 or /players/1.json
  def destroy
    @player.destroy

    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions

    def set_player
      @player = Player.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def player_params
      params.require(:player).permit(:first_name, :team_id, :last_name, :position, :nba_id, :slug, :draft_year, :trade_block)
    end
end
