class ChannelController < ApplicationController
  def show
    @user = User.find_by_username(params[:id])
    @sub_count = Subscription.where(sub_id: @user.id).count
    @videos = Video.where(user_id: @user.id)
  end
  
  def videos
    @user = User.find_by_username(params[:channel_id])
    @sub_count = Subscription.where(sub_id: @user.id).count
    @videos = Video.where(user_id: @user.id)
  end
  
  def about
    @user = User.find_by_username(params[:channel_id])
    @sub_count = Subscription.where(sub_id: @user.id).count
    @videos = Video.where(user_id: @user.id)
  end
  
  # ajax methods
  def subscribe
    @user = User.find_by_username(params[:channel_id])
    Subscription.create(user_id: current_user.id, sub_id: @user.id)
  end
  
  def unsubscribe
    @user = User.find_by_username(params[:channel_id])
    Subscription.where(user_id: current_user.id, sub_id: @user.id).destroy_all
  end

  def subcount
    @user = User.find_by_username(params[:channel_id])
    @sub_count = Subscription.where(sub_id: @user.id).count
    respond_to do |format|
      format.json{render :json => @sub_count }
    end
  end
end