class TradeMachinesController < ApplicationController
  before_action :set_trade_machine, only: %i[ show edit update destroy ]
  skip_before_action :authenticate_league_admin

  # GET /trade_machines or /trade_machines.json
  def index
    @trade_machines = TradeMachine.all
    render json: @trade_machines
  end

  # GET /trade_machines/1 or /trade_machines/1.json
  def show
    render json: @trade_machine
  end

  # GET /trade_machines/new
  def new
  end

  # GET /trade_machines/1/edit
  def edit
  end

  # POST /trade_machines or /trade_machines.json
  def create
    @trade_machine = TradeMachine.new(trade_machine_params)

    respond_to do |format|
      if @trade_machine.save
        format.html { redirect_to trade_machine_url(@trade_machine), notice: "Trade machine was successfully created." }
        format.json { render :show, status: :created, location: @trade_machine }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @trade_machine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trade_machines/1 or /trade_machines/1.json
  def update
    respond_to do |format|
      if @trade_machine.update(trade_machine_params)
        format.html { redirect_to trade_machine_url(@trade_machine), notice: "Trade machine was successfully updated." }
        format.json { render :show, status: :ok, location: @trade_machine }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @trade_machine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trade_machines/1 or /trade_machines/1.json
  def destroy
    @trade_machine.destroy

    respond_to do |format|
      format.html { redirect_to trade_machines_url, notice: "Trade machine was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trade_machine
      @trade_machine = TradeMachine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trade_machine_params
      params.fetch(:trade_machine, {})
    end
end
