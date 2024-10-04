require 'espn_nba_fantasy'
class LeaguesController < ApplicationController
  before_action :set_league, only: %i[ members show edit update destroy ]

  # GET /leagues or /leagues.json
  def index
    @leagues = current_user.leagues
    render json: @leagues.as_json(include: :teams)
  end

  # GET /leagues/1 or /leagues/1.json
  def show
    @teams = @league.teams
    render json: @league.as_json(include: :teams)
  end

  def members
    render json: @league.members
  end

  # GET /leagues/new
  def new
  end

  # GET /leagues/1/edit
  def edit
  end

  # POST /leagues or /leagues.json
  def create
    @league = current_user.owned_leagues.new(league_params)

    if @league.save
      render json: @league, status: :created
    else
      render json: @league.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /leagues/1 or /leagues/1.json
  def update
    if @league.update(league_params)
      render json: @league, status: :ok
    else
      render json: @league.errors, status: :unprocessable_entity
    end
  end

  # DELETE /leagues/1 or /leagues/1.json
  def destroy
    @league.destroy

    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Only allow a list of trusted parameters through.
    def league_params
      params.require(:league).permit(:league_id, :name, :current_start_year, :current_end_year)
    end
end
