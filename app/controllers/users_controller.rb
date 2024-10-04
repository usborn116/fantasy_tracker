class UsersController < ApplicationController
  skip_before_action :set_league

  # GET /me
  def show
    render json: current_user.as_json(include: [:teams, :leagues, :owned_leagues])
  end

end
