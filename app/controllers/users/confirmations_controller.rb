class Users::ConfirmationsController < Devise::ConfirmationsController
  skip_before_action :authenticate_user!
  skip_before_action :set_league
  skip_before_action :authenticate_league_admin
  respond_to :json

  private
  
  def respond_with(resource, _opts = {})
    if resource.errors.empty?
      render json: resource, status: :ok
    else
      render json: resource.errors, status: :unprocessable_entity
    end
  end
  
end