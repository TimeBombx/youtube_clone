module ChannelHelper
  def sub_button
    capture do
      classes = "button "
      classes += "alert " if is_subscribed?
      classes += "disabled " if is_viewing_self?
      value = is_subscribed? ? "Unsubscribe" : "Subscribe"
      concat tag(:input, type: "button", class: classes, value: value)
    end
  end
end