class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :authenticate_user!
  skip_before_action :set_league
  skip_before_action :authenticate_league_admin
  
end