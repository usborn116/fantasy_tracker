class LeagueMembershipsController < ApplicationController
  before_action :set_league_membership, only: %i[ show edit update destroy ]
  before_action :authenticate_league_admin, only: %i[ new create edit update destroy ]

  # GET /user_leagues or /user_leagues.json
  def index
    @league_memberships = @league.league_memberships
    render json: @league_memberships
  end

  # GET /user_leagues/1 or /user_leagues/1.json
  def show
    render json: @league_membership
  end

  # GET /user_leagues/new
  def new
  end

  # GET /user_leagues/1/edit
  def edit
  end

  # POST /user_leagues or /user_leagues.json
  def create
    @league_membership = @league.league_memberships.new(league_membership_params)

      if @league_membership.save
        render json: @league_membership, status: :created
      else
        render json: @league_membership.errors, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /user_leagues/1 or /user_leagues/1.json
  def update
    if @league_membership.update(league_membership_params)
      render json: @league_membership, status: :ok
    else
      render json: @league_membership.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_leagues/1 or /user_leagues/1.json
  def destroy
    @league_membership.destroy

    render head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_league_membership
      @league_membership = LeagueMembership.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def league_membership_params
      params.require(:league_membership).permit(:member_id, :league_id, :role)
    end
end
