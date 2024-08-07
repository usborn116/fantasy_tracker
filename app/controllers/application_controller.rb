class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_league
  before_filter :authenticate_league_admin, only: %i[ new edit create update destroy ]

  private 

  def authenticate_league_admin
    @league.admins.include?(current_user)
  end

  def set_league
    @league = League.find(params[:league_id])
  end

end
