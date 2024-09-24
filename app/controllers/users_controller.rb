class UserTeamsController < ApplicationController
  skip_before_action :set_league
  before_action :set_user_team, only: %i[ show edit update destroy ]

  # GET /me
  def show
    current_user.include(:teams, :leagues, :owned_leagues)
  end

end
