class DraftPicksController < ApplicationController
  before_action :set_season
  before_action :set_draft_pick, only: %i[ show edit update destroy ]
  before_action :authenticate_league_admin, only: %i[ new create edit update destroy ]

  # GET /draft_picks or /draft_picks.json
  def index
    @draft_picks = @season.draft_picks
    render json: @draft_picks
  end

  # GET /draft_picks/1 or /draft_picks/1.json
  def show
    render json: @draft_pick
  end

  # GET /draft_picks/new
  def new
  end

  # GET /draft_picks/1/edit
  def edit
  end

  # POST /draft_picks or /draft_picks.json
  def create
    @draft_pick = @season.draft_picks.new(draft_pick_params)
    @draft_pick.assign_attributes(year: @season.end_year)

    if @draft_pick.save
      render json: @draft_pick, status: :created
    else
      render json: @draft_pick.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /draft_picks/1 or /draft_picks/1.json
  def update
    if @draft_pick.update(draft_pick_params)
      render json: @draft_pick, status: :ok
    else
      render json: @draft_pick.errors, status: :unprocessable_entity
    end
  end

  # DELETE /draft_picks/1 or /draft_picks/1.json
  def destroy
    @draft_pick.destroy

    render head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_season
      @season = Season.find(params[:season_id])
    end

    def set_draft_pick
      @draft_pick = DraftPick.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def draft_pick_params
      params.require(:draft_pick).permit(:round, :pick, :original_owner_id, :team_id)
    end
end
