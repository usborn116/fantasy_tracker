class TradesController < ApplicationController
  before_action :set_trade, only: %i[ show edit update destroy ]
  skip_before_action :authenticate_league_admin, except: %i[ update edit ]
  before_action :authenticate_admin_or_ownership, only: %i[ show index edit update destroy ]

  # GET /trades or /trades.json
  def index
    @trades = current_user.trade_proposals + current_user.received_trade_proposals
  end

  # GET /trades/1 or /trades/1.json
  def show
  end

  # GET /trades/new
  def new
    @trade = @league.trades.new
  end

  # GET /trades/1/edit
  def edit
  end

  # POST /trades or /trades.json
  def create
    @trade = Trade.new(trade_params)

    respond_to do |format|
      if @trade.save
        format.html { redirect_to trade_url(@trade), notice: "Trade was successfully created." }
        format.json { render :show, status: :created, location: @trade }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @trade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trades/1 or /trades/1.json
  def update
    respond_to do |format|
      if @trade.update(trade_params)
        format.html { redirect_to trade_url(@trade), notice: "Trade was successfully updated." }
        format.json { render :show, status: :ok, location: @trade }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @trade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trades/1 or /trades/1.json
  def destroy
    @trade.destroy

    respond_to do |format|
      format.html { redirect_to trades_url, notice: "Trade was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    
    def authenticate_admin_or_ownership
      set_trade
      unless @league.admins.include?(current_user) || @team.users.include?(current_user)
        redirect_back fallback_location: root_path, notice: "You must be an admin or own this #{controller_name}"
      end
    end

    def set_trade
      @trade = Trade.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trade_params
      params.require(:trade).permit(:team1_id, :team2_id, :outgoing, :incoming, :team_season_id)
    end
end
