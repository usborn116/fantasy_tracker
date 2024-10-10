require 'espn_nba_fantasy'

class TeamsController < ApplicationController
  before_action :set_team, only: %i[ roster show edit update destroy ]
  skip_before_action :authenticate_league_admin
  before_action :authenticate_admin_or_ownership, only: %i[ create edit new update destroy ]

  # GET /teams or /teams.json
  def index
    @teams = @league.teams
    render json: @teams.as_json(include: [:users, :league])
  end

  # GET /teams/1 or /teams/1.json
  def show
    render json: @team.as_json(include: [:users, :league, { draft_picks: {include: [:original_owner, :team, :season] }}])
  end

  def roster
    @search_results = params[:last_name] ? NbaPool::Player.where("LOWER(last_name) like ?", "#{params[:last_name].downcase}%").distinct : []
    render json: {team: @team.as_json(include: [{players: {include: :team}}, :draft_picks]), search_results: @search_results}
  end

  def user_options
    @options = @league.admins.include?(current_user) ? @league.members : @league.members.where(id: current_user.id)
    render json: @options
  end

  # GET /teams/new
  def new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams or /teams.json
  def create
    @team = @league.teams.new(team_params)
    @team.user_teams.build

    if @team.save
      render json: @team, status: :created
    else
      render json: @team.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /teams/1 or /teams/1.json
  def update
    if @team.update(team_params)
      render json: @team, status: :ok
    else
      render json: @team.errors, status: :unprocessable_entity
    end
  end

  # DELETE /teams/1 or /teams/1.json
  def destroy
    @team.destroy

    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def authenticate_admin_or_ownership
      set_team
      unless @league.admins.include?(current_user) || @team.users.include?(current_user)
        redirect_back fallback_location: root_path, notice: "You must be an admin or own this #{controller_name}"
      end
    end

    def set_team
      identifier = params[:team_id] || params[:id]
      @team = Team.find(identifier)
    end

    # Only allow a list of trusted parameters through.
    def team_params
      params.require(:team).permit(:name, user_teams_attributes: [:user_id, :team_id] )
    end
end
