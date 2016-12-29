class SubscriptionsController < ApplicationController
  def index
    sub_ids = current_user.subscriptions.pluck(:sub_id)
    @videos = Video.where(user_id: sub_ids)
  end
end
