class UsersController < ApplicationController
  skip_before_action :set_league
  skip_before_action :authenticate_user!

  # GET /me
  def show
    if current_user
      render json: current_user.as_json(include: [:teams, :leagues, :owned_leagues])
    else
      render json: { message: 'not logged in', status: :unauthorized }
    end
  end

end
