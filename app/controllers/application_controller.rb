class ApplicationController < ActionController::Base
<<<<<<< HEAD
=======
	include CurrentBasket
	before_action :set_basket
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :username, :birthdate])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :username, :birthdate])
  end
>>>>>>> master
end
