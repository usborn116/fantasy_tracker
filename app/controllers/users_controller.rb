class UsersController < ApplicationController
  skip_before_action :set_league
  skip_before_action :authenticate_user!

  # GET /me
  def show
    if current_user
      render json: current_user.attributes.slice('name', 'email').as_json(include: [:teams, :leagues, :owned_leagues])
    else
      render json: nil
    end
  end

end
