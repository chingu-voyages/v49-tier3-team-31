class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_unread_notifications_count

  protected

  def after_sign_in_path_for(resource)
    profile_users_path(resource) # Modify this according to your routes
  end



  # This method is used to add additional fields to the Devise registration form
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password, :password_confirmation, :role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email, :password, :password_confirmation, :current_password,:bio, :role, :price, :photos, :avatar, :address, :country, :city, :state, :zip, :birthday])
  end
  
  def set_unread_notifications_count
    if user_signed_in?
      @unread_notifications_count = current_user.notifications.unread.count
    end
  end
end