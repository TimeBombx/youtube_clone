module SubscriptionsHelper
  def is_subscribed?(channel)
    return false unless is_logged_in?
    
    Subscription.exists?(user_id: current_user.id, channel_id: channel.id)
  end
  
  def is_viewing_self?(channel)
    return false if !is_logged_in?
    current_user.channel == channel
  end
end
