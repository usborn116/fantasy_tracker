class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_league
  before_action :authenticate_league_admin, only: %i[ edit update destroy ]

  private 

  def authenticate_league_admin
    set_league
    unless @league.admins.include?(current_user)
      flash[:error] = "You must be a league admin to perform this action"
      redirect_back(fallback_location: root_path)
    end
  end

  def set_league
    lookup = params[:league_id] || params[:id]
    puts 'LOOKUP'
    puts lookup
    @league = League.find(lookup)
  end

end
