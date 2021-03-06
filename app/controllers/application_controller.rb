class ApplicationController < ActionController::Base
	include CurrentBasket
	before_action :current_basket
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :username, :birthdate])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :username, :birthdate])
  end
end
