class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  #This redirects the user to the login screen
  #before_action :authenticate_user!
end
