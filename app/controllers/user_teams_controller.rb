class UserTeamsController < ApplicationController
  skip_before_action :set_league
  before_action :set_user_team, only: %i[ show edit update destroy ]

  # GET /user_teams or /user_teams.json
  def index
    @user_teams = current_user.teams
    render json: @user_teams.as_json(include: [:users, :league])
  end

  # GET /user_teams/1 or /user_teams/1.json
  def show
    render json: @user_team
  end

  # GET /user_teams/new
  def new
  end

  # GET /user_teams/1/edit
  def edit
  end

  # POST /user_teams or /user_teams.json
  def create
  end

  # PATCH/PUT /user_teams/1 or /user_teams/1.json
  def update
  end

  # DELETE /user_teams/1 or /user_teams/1.json
  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_team
      @user_team = UserTeam.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_team_params
      params.require(:user_team).permit(:user_id, :team_id)
    end
end
