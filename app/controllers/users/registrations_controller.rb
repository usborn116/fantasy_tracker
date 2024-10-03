class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :authenticate_user!
  skip_before_action :set_league
  skip_before_action :authenticate_league_admin
  respond_to :json

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def destroy
    resource.destroy
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    render json: { message: "User deleted." }
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  private
  
  def respond_with(resource, _opts = {})
    render json: resource
  end
  
  def respond_to_on_destroy
    render json: { message: "Logged out." }
  end

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
  
end