class SessionsController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    if auth_user(user_params[:username], user_params[:password])
      flash.notice = "Successfully logged in."
      redirect_to root_path
    else
      @user = User.new
      @user.errors.add(:incorrect, "username or password.")
      render 'new'
    end
  end
  
  def destroy
    reset_session
    flash.notice = "Successfully logged out."
    redirect_to root_path
  end
  
  private
    def user_params
      params.require(:user).permit!
    end
end
