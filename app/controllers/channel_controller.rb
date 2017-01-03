class ChannelController < ApplicationController
  def show
    common
    @videos = Video.where(channel_id: @user.id)
  end
  
  def edit
    common
    @settings = @user.settings
  end
  
  def update
    @channel = Channel.find(params[:id])
    
    if @channel.update_attributes(settings_params)
      redirect_to edit_channel_path(@channel.user)
    else
      render 'edit'
    end
  end
  
  def videos
    common
    @videos = Video.where(channel_id: @user.id)
  end
  
  def about
    common
    @videos = Video.where(channel_id: @user.id)
  end
  
  # ajax methods
  def subscribe
    @user = User.find_by_username(params[:channel_id])
    Subscription.create(user_id: current_user.id, channel_id: @user.channel.id)
  end
  
  def unsubscribe
    @user = User.find_by_username(params[:channel_id])
    Subscription.where(user_id: current_user.id, channel_id: @user.channel.id).destroy_all
  end

  def subcount
    @user = User.find_by_username(params[:channel_id])
    @sub_count = Subscription.where(channel_id: @user.channel.id).count
    respond_to do |format|
      format.json{render :json => @sub_count }
    end
  end
  
  private
    def settings_params
      params.require(:channel).permit!
    end
    
    def common
      @user = User.find_by_username(params[:id] || params[:channel_id])
      @channel = Channel.find(@user.id)
      @sub_count = Subscription.where(channel_id: @user.channel.id).count
    end
end