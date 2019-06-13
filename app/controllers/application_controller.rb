class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

 def update(params)
    @user = User.find(current_user.id)
    puts "UPDATE REACHED!!----------------------------"
    puts @user
    
    redirect_to "http://www.rubyonrails.org"
    
    if @user.update_attributes(params)
      return 0
    end
 end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password,
      :password_confirmation, :remember_me, :avatar, :avatar_cache, :remove_avatar,
      :birth_date, :sex, :sexuality, :style, :min_age, :max_age) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password,
      :password_confirmation, :current_password, :avatar, :avatar_cache, :remove_avatar,
      :birth_date, :sex, :sexuality, :style, :min_age, :max_age) }
  end  
  
  
  #This redirects the user to the login screen
  #before_action :authenticate_user!
end
