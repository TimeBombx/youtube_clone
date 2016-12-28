module AuthHelper
  def auth_user(username, password)
    user = User.find_by_username(username)
    
    return false if user.nil?
    
    if user.password == password
      session[:user_id] = user.id
      @current_user = user
      true
    else
      false
    end
  end
  
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