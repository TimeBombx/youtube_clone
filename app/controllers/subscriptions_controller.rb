class SubscriptionsController < ApplicationController
  def index
    @videos = [Video.last]
  end
end
