module ChannelHelper
  def sub_button_helper
    capture do
      classes = "button sub-button "
      # classes += "alert " if is_subscribed?
      classes += "disabled " if is_viewing_self?
      value = is_subscribed? ? "Subscribed" : "Subscribe"
      concat tag(:input, type: "button", class: classes, value: value, data: { user: "#{@user.username}" })
    end
  end
  
  def channel_nav_helper
    nav_options = {
      home: channel_path(@user), 
      videos: channel_videos_path(@user), 
      about: channel_about_path(@user)
    }
    
    capture do
      concat content_tag(:ul, id: 'channel-nav') {
        nav_options.each do |key, value|
          classes = "selected" if current_page?(value)
          
          concat content_tag(:a, href: value) {
            concat content_tag(:li, class: classes) {
              concat key.to_s.capitalize
            }
          }
        end
      }
    end
  end
end