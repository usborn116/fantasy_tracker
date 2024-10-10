class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  protect_from_forgery prepend: true
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!
  before_action :set_league
  before_action :authenticate_league_admin, only: %i[ edit update destroy ]

  NotAuthorized = Class.new(StandardError)

  rescue_from ApplicationController::NotAuthorized do |e|
    render json: { message: "You are not an admin of this league", status: 403 }, status: 403
  end

  private 

  def authenticate_league_admin
    set_league
    raise ApplicationController::NotAuthorized.new() unless @league.admins.include?(current_user)
  end

  def set_league
    lookup = params[:league_id] || params[:id]
    @league = League.find(lookup)
  end

end
