class ApplicationController < ActionController::Base
  include AuthHelper
  layout "main"

  protect_from_forgery with: :exception
  
  def user_settings
    current_user.settings if current_user
  end
end
