class ChannelController < ApplicationController
  def show
    @user = User.find_by_username(params[:id])
    @sub_count = Subscription.where(sub_id: @user.id).count
    @videos = Video.where(user_id: @user.id)
  end
end