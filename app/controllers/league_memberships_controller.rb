class LeagueMembershipsController < ApplicationController
  skip_before_action :set_league
  before_action :set_user_league, only: %i[ show edit update destroy ]

  # GET /user_leagues or /user_leagues.json
  def index
    @user_leagues = LeagueMembership.all
  end

  # GET /user_leagues/1 or /user_leagues/1.json
  def show
  end

  # GET /user_leagues/new
  def new
    @user_league = LeagueMembership.new
  end

  # GET /user_leagues/1/edit
  def edit
  end

  # POST /user_leagues or /user_leagues.json
  def create
    @user_league = LeagueMembership.new(user_league_params)

    respond_to do |format|
      if @user_league.save
        format.html { redirect_to user_league_url(@user_league), notice: "User league was successfully created." }
        format.json { render :show, status: :created, location: @user_league }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_league.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_leagues/1 or /user_leagues/1.json
  def update
    respond_to do |format|
      if @user_league.update(user_league_params)
        format.html { redirect_to user_league_url(@user_league), notice: "User league was successfully updated." }
        format.json { render :show, status: :ok, location: @user_league }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_league.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_leagues/1 or /user_leagues/1.json
  def destroy
    @user_league.destroy

    respond_to do |format|
      format.html { redirect_to user_leagues_url, notice: "User league was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_league
      @user_league = LeagueMembership.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_league_params
      params.require(:user_league).permit(:user_id, :league_id)
    end
end
