class SalariesController < ApplicationController
  before_action :set_league
  before_action :set_player
  before_action :set_salary, only: %i[ show edit update destroy ]
  before_action :authenticate_league_admin, only: %i[ new create edit update destroy ]

  # GET /salaries or /salaries.json
  def index
    @salaries = @player.salaries.all
  end

  # GET /salaries/1 or /salaries/1.json
  def show
  end

  # GET /salaries/new
  def new
    @salary = @player.salaries.new
  end

  # GET /salaries/1/edit
  def edit
  end

  # POST /salaries or /salaries.json
  def create
    @salary = @player.salaries.new(salary_params)

    respond_to do |format|
      if @salary.save
        format.html { redirect_to league_player_salary_url(@league, @player, @salary), notice: "Salary was successfully created." }
        format.json { render :show, status: :created, location: @salary }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @salary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /salaries/1 or /salaries/1.json
  def update
    respond_to do |format|
      if @salary.update(salary_params)
        format.html { redirect_to league_player_salary_url(@league, @player, @salary), notice: "Salary was successfully updated." }
        format.json { render :show, status: :ok, location: @salary }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @salary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /salaries/1 or /salaries/1.json
  def destroy
    @salary.destroy

    respond_to do |format|
      format.html { redirect_to league_player_salaries_url(@league, @player), notice: "Salary was successfully destroyed." }
      format.json { head :no_content }
    end
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
      params.require(:salary).permit(:season_id, :value, :free_agent, :waiver_acquisition)
    end
end
