class SeasonsController < ApplicationController
  before_action :set_season, only: %i[ show edit update destroy ]
  before_action :authenticate_league_admin, only: %i[ new create edit update destroy ]

  # GET /seasons or /seasons.json
  def index
    @seasons = @league.seasons
    render json: @seasons
  end

  # GET /seasons/1 or /seasons/1.json
  def show
    render json: @season
  end

  # GET /seasons/new
  def new
  end

  # GET /seasons/1/edit
  def edit
  end

  # POST /seasons or /seasons.json
  def create
    @season = @league.seasons.new(season_params)

    if @season.save
      render json: @season, status: :created
    else
      render json: @season.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /seasons/1 or /seasons/1.json
  def update
    if @season.update(season_params)
      render json: @season, status: :ok
    else
      render json: @season.errors, status: :unprocessable_entity
    end
  end

  # DELETE /seasons/1 or /seasons/1.json
  def destroy
    @season.destroy

    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_season
      @season = Season.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def season_params
      params.require(:season).permit(:league_id, :start_year, :end_year)
    end
end
