class SubscriptionsController < ApplicationController
  def index
    if is_logged_in?
      channel_ids = current_user.subscriptions.pluck(:channel_id)
      @videos = Video.where(channel_id: channel_ids)
    else
      @videos = Video.all.order(views: :desc).limit(10)
    end
  end
end
