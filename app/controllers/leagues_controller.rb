require 'espn_nba_fantasy'
class LeaguesController < ApplicationController
  before_action :set_league, only: %i[ members show edit update destroy ]

  # GET /leagues or /leagues.json
  def index
    @leagues = current_user.leagues
    render json: @leagues
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

    respond_to do |format|
      if @league.save
        format.html { redirect_to league_url(@league), notice: "League was successfully created." }
        format.json { render :show, status: :created, location: @league }
      else
        format.html { render :new, status: :unprocessable_entity, notice: "#{@league.errors}" }
        format.json { render json: @league.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leagues/1 or /leagues/1.json
  def update
    respond_to do |format|
      if @league.update(league_params)
        format.html { redirect_to league_url(@league), notice: "League was successfully updated." }
        format.json { render :show, status: :ok, location: @league }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @league.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leagues/1 or /leagues/1.json
  def destroy
    @league.destroy

    respond_to do |format|
      format.html { redirect_to leagues_url, notice: "League was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Only allow a list of trusted parameters through.
    def league_params
      params.require(:league).permit(:league_id, :name, :current_start_year, :current_end_year)
    end
end
