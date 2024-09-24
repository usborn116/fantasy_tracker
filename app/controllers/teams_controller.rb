require 'espn_nba_fantasy'

class TeamsController < ApplicationController
  before_action :set_team, only: %i[ roster show edit update destroy ]
  skip_before_action :authenticate_league_admin
  before_action :authenticate_admin_or_ownership, only: %i[ create edit new update destroy ]

  # GET /teams or /teams.json
  def index
    @teams = @league.teams
  end

  # GET /teams/1 or /teams/1.json
  def show
  end

  def roster
    @players = @team.players

    if params[:last_name] != ""
      @nba_players = NbaPool::Player.where("last_name like ?", "#{params[:last_name]}")
    end
    
    @draft_picks = @team.draft_picks
  end

  # GET /teams/new
  def new
    @team = @league.teams.new
    @team.user_teams.build
    @options = @league.admins.include?(current_user) ? @league.members : @league.members.where(id: current_user.id)
  end

  # GET /teams/1/edit
  def edit

    @options = @league.admins.include?(current_user) ? @league.members : @league.members.where(id: current_user.id)
  end

  # POST /teams or /teams.json
  def create
    @team = @league.teams.new(team_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to league_team_url(@league, @team), notice: "Team was successfully created." }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1 or /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to league_team_url(@league, @team), notice: "Team was successfully updated." }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1 or /teams/1.json
  def destroy
    @team.destroy

    respond_to do |format|
      format.html { redirect_to league_teams_url(@league), notice: "Team was successfully destroyed." }
      format.json { head :no_content }
    end
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
      params.require(:team).permit(:name, user_teams_attributes: [:user_id] )
    end
end
