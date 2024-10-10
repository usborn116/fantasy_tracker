class TeamSeasonsController < ApplicationController
  before_action :set_team_season, only: %i[ show edit update destroy ]
  before_action :set_team
  before_action :authenticate_league_admin, only: %i[ new create edit update destroy ]

  # GET /team_seasons or /team_seasons.json
  def index
    @team_seasons = @team.team_seasons#.as_json(include: [:season, :team])
    res = []
    @team_seasons.each do |ts|
      t = ts.as_json(:include => [:season, :team])
      t['roster_size'] = ts.roster_size
      t['soft_cap_room'] = ts.soft_cap_room
      t['hard_cap_room'] = ts.hard_cap_room
      t['max_RFA_bid'] = ts.max_RFA_bid
      t['max_UFA_bid'] = ts.max_UFA_bid
      t['incoming_picks'] = ts.incoming_picks
      t['dead_cap'] = ts.dead_cap
      res << t
    end
    render json: res
  end

  # GET /team_seasons/1 or /team_seasons/1.json
  def show
    t = @team_season.as_json(:include => [:season, :team])
    t['roster_size'] = @team_season.roster_size
    t['soft_cap_room'] = @team_season.soft_cap_room
    t['hard_cap_room'] = @team_season.hard_cap_room
    t['max_RFA_bid'] = @team_season.max_RFA_bid
    t['max_UFA_bid'] = @team_season.max_UFA_bid
    t['incoming_picks'] = @team_season.incoming_picks
    t['dead_cap'] = @team_season.dead_cap
    render json: t
  end

  # GET /team_seasons/new
  def new
  end

  # GET /team_seasons/1/edit
  def edit
  end

  # POST /team_seasons or /team_seasons.json
  def create
    @team_season = @team.team_seasons.new(team_season_params)

    if @team_season.save
      render json: @team_season, status: :created
    else
      render json: @team_season.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /team_seasons/1 or /team_seasons/1.json
  def update
    if @team_season.update(team_season_params)
      render json: @team_season, status: :ok
    else
      render json: @team_season.errors, status: :unprocessable_entity
    end
  end

  # DELETE /team_seasons/1 or /team_seasons/1.json
  def destroy
    @team_season.destroy

    head :no_content
  end

  private
    # Use callbacks to share common setup or cosnstraints between actions.
    #
    def set_team
      @team = Team.find(params[:team_id])
    end

    def set_team_season
      @team_season = TeamSeason.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def team_season_params
      params.require(:team_season).permit(:season_id)
    end
end
