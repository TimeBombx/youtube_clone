module SubscriptionsHelper
  def is_subscribed?#(channel_user)
    return false unless is_logged_in?
    
    Subscription.exists?(user_id: current_user.id, sub_id: @user.id)
  end
  
  def is_viewing_self?
    @user == current_user
  end
end
