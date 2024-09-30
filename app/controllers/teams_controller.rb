require 'espn_nba_fantasy'

class TeamsController < ApplicationController
  before_action :set_team, only: %i[ roster show edit update destroy ]

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
    
  end

  # GET /teams/new
  def new
    @team = @league.teams.new
    @team.user_teams.build
  end

  # GET /teams/1/edit
  def edit
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
    def set_team
      identifier = params[:team_id] || params[:id]
      @team = Team.find(identifier)
    end

    # Only allow a list of trusted parameters through.
    def team_params
      params.require(:team).permit(:name, user_teams_attributes: [:user_id] )
    end
end
