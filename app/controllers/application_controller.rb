class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_league
  before_action :authenticate_league_admin, only: %i[ new edit create update destroy ]

  private 

  def authenticate_league_admin
    unless @league.admins.include?(current_user)
      flash[:error] = "You must be a league admin to perform this action"
      redirect_back(fallback_location: root_path)
    end
  end

  def set_league
    @league = League.find(params[:league_id])
  end

end
