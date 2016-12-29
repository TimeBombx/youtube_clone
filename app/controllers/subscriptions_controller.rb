class SubscriptionsController < ApplicationController
  def index
    if is_logged_in?
      sub_ids = current_user.subscriptions.pluck(:sub_id)
      @videos = Video.where(user_id: sub_ids)
    else
      @videos = Video.all.order(views: :desc).limit(10)
    end
  end
end
