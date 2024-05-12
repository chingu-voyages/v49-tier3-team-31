class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # This method is used to add additional fields to the Devise registration form
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :first_name, :last_name,:photo, :price, :email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:role, :first_name, :last_name,:photo, :price,  :email, :password, :password_confirmation, :current_password])
  end
end
