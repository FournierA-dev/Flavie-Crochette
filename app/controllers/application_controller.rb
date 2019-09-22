class ApplicationController < ActionController::Base

  add_flash_types :info, :success, :warning, :danger

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:alias, :age])
   # devise_parameter_sanitizer.permit(:account_update, keys: [:alias, :age])
  end

end
