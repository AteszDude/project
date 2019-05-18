class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:birth_date, :sex, :likes])
  end
  
  #This redirects the user to the login screen
  #before_action :authenticate_user!
end
