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

    respond_to do |format|
      if @league_membership.save
        format.html { redirect_to league_league_membership_url(@league, @league_membership), notice: "User league was successfully created." }
        format.json { render :show, status: :created, location: @league_membership }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @league_membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_leagues/1 or /user_leagues/1.json
  def update
    respond_to do |format|
      if @league_membership.update(league_membership_params)
        format.html { redirect_to league_league_membership_url(@league, @league_membership), notice: "User league was successfully updated." }
        format.json { render :show, status: :ok, location: @league_membership}
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @league_membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_leagues/1 or /user_leagues/1.json
  def destroy
    @league_membership.destroy

    respond_to do |format|
      format.html { redirect_to league_memberships_url, notice: "User league was successfully destroyed." }
      format.json { head :no_content }
    end
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
