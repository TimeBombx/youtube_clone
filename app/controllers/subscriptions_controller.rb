class SubscriptionsController < ApplicationController
  def index
    @videos = Video.all
  end
end
