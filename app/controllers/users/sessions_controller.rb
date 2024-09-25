class Users::SessionsController < Devise::SessionsController
  skip_before_action :authenticate_user!
  skip_before_action :set_league
  skip_before_action :authenticate_league_admin
  
end