class UsersController < ApplicationController
  def show
    @user = User.find_by_username(params[:id])
    @sub_count = Subscription.where(sub_id: @user.id).count
  end

  def new
    @user = User.new
  end

  def edit
    @user = current_user
  end

  def create
    @user = User.new
    
    if user_params[:password].empty? || user_params[:password_confirmation].empty?
      @user.errors.add(:password, "can't be empty.")
      render 'new'
    else
      if user_params[:password] == user_params[:password_confirmation]
        @user.email = user_params[:email]
        @user.username = user_params[:username]
        @user.password = user_params[:password]
        @user.settings = default_settings
        
        if @user.save
          auth_user(@user.username, user_params[:password])
          flash.notice = "Successfully made account."
          redirect_to root_path
        else 
          render 'new'
        end
      else
        @user.errors.add(:the, 'passwords entered are not the same')
        render 'new'
      end
    end
  end

  def update
    
  end
  
  def settings
    @user = current_user
    @settings = @user.settings
  end
  
  private
    def user_params
      params.require(:user).permit!
    end
    
    def default_settings
      []
    end
end
