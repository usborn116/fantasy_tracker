class Users::ConfirmationsController < Devise::ConfirmationsController
  skip_before_action :authenticate_user!
  skip_before_action :set_league
  skip_before_action :authenticate_league_admin
  respond_to :json

  private
  
  def respond_with(resource, _opts = {})
    render json: resource
  end
  
end