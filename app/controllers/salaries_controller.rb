class SalariesController < ApplicationController
  before_action :set_league
  before_action :set_player
  before_action :set_salary, only: %i[ show edit update destroy ]
  before_action :authenticate_league_admin, only: %i[ new create edit update destroy ]

  # GET /salaries or /salaries.json
  def index
    @salaries = @player.salaries
    render json: @salaries.as_json(include: [:player, :season])
  end

  # GET /salaries/1 or /salaries/1.json
  def show
    render json: @salary.as_json(include: [:player, :season])
  end

  # GET /salaries/new
  def new
  end

  # GET /salaries/1/edit
  def edit
  end

  # POST /salaries or /salaries.json
  def create
    @salary = @player.salaries.new(salary_params)

    if @salary.save
      render json: @salary, status: :created
    else
      render json: @salary.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /salaries/1 or /salaries/1.json
  def update
    if @salary.update(salary_params)
      render json: @salary, status: :ok
    else
      render json: @salary.errors, status: :unprocessable_entity
    end
  end

  # DELETE /salaries/1 or /salaries/1.json
  def destroy
    @salary.destroy

    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # 

    def set_player
      @player = Player.find(params[:player_id])
    end

    def set_salary
      @salary = Salary.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def salary_params
      params.require(:salary).permit(:season_id, :value, :free_agent, :waiver_acquisition, :waived)
    end
end
