class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  protect_from_forgery prepend: true
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!
  before_action :set_league
  before_action :authenticate_league_admin, only: %i[ edit update destroy ]

  private 

  def authenticate_league_admin
    set_league
    unless @league.admins.include?(current_user)
      render json: { message: "You must be a league admin to perform this action", status: :unauthorized }
    end
  end

  def set_league
    lookup = params[:league_id] || params[:id]
    @league = League.find(lookup)
  end

end
