module AuthHelper
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  rescue ActiveRecord::RecordNotFound
    reset_session
    redirect_to login_path
  end
  
  def is_logged_in?
    true if current_user
  end
end