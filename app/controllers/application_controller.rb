class ApplicationController < ActionController::Base
  include AuthHelper
  layout "main"

  protect_from_forgery with: :exception
  
  helper_method :current_user, :user_settings, :is_logged_in?
  
  def user_settings
    current_user.settings if current_user
  end
end
