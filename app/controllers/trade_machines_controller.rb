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

    if @trade_machine.save
      render json: @trade_machine, status: :created
    else
      render json: @trade_machine.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trade_machines/1 or /trade_machines/1.json
  def update
      if @trade_machine.update(trade_machine_params)
        render json: @trade_machine, status: :ok
      else
        render json: @trade_machine.errors, status: :unprocessable_entity
      end
  end

  # DELETE /trade_machines/1 or /trade_machines/1.json
  def destroy
    @trade_machine.destroy

    head :no_content
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
