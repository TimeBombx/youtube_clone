class UsersController < ApplicationController
  def show
    @user = User.find(params['id'])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params['id'])
  end

  def create
    
  end

  def update
    
  end
  
  def settings
    @user = User.find(params['id'])
    @settings = @user.settings
  end
  
  private
    def user_params
      params.require(:user).permit!
    end
end
