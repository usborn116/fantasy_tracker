class DraftPicksController < ApplicationController
  before_action :set_draft_pick, only: %i[ show edit update destroy ]

  # GET /draft_picks or /draft_picks.json
  def index
    @draft_picks = DraftPick.all
  end

  # GET /draft_picks/1 or /draft_picks/1.json
  def show
  end

  # GET /draft_picks/new
  def new
    @draft_pick = DraftPick.new
  end

  # GET /draft_picks/1/edit
  def edit
  end

  # POST /draft_picks or /draft_picks.json
  def create
    @draft_pick = DraftPick.new(draft_pick_params)

    respond_to do |format|
      if @draft_pick.save
        format.html { redirect_to draft_pick_url(@draft_pick), notice: "Draft pick was successfully created." }
        format.json { render :show, status: :created, location: @draft_pick }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @draft_pick.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /draft_picks/1 or /draft_picks/1.json
  def update
    respond_to do |format|
      if @draft_pick.update(draft_pick_params)
        format.html { redirect_to draft_pick_url(@draft_pick), notice: "Draft pick was successfully updated." }
        format.json { render :show, status: :ok, location: @draft_pick }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @draft_pick.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /draft_picks/1 or /draft_picks/1.json
  def destroy
    @draft_pick.destroy

    respond_to do |format|
      format.html { redirect_to draft_picks_url, notice: "Draft pick was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_draft_pick
      @draft_pick = DraftPick.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def draft_pick_params
      params.require(:draft_pick).permit(:year, :round, :pick)
    end
end
