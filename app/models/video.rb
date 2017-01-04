class Video < ApplicationRecord
  require 'securerandom'
  include ActionView::Helpers::DateHelper
  
  belongs_to :channel
  
  has_attached_file :video, styles: {
        # :medium => {
        #   :geometry => "640x480",
        #   :format => 'mp4'
        # },
        :thumb => { :geometry => "1920x1080", :format => 'jpeg', :time => 10},
        :thumb_small => { :geometry => "160x120", :format => 'jpeg', :time => 10}
    }, :processors => [:transcoder],
    :size => { :in => 0..25.megabytes }
    
  validates_presence_of :video
  validates_attachment_content_type :video, content_type: /\Avideo\/.*\Z/
  
  before_save :generate_uid
  
  def generate_uid
    self.uid ||= SecureRandom.urlsafe_base64(10)
  end
  
  def stats
    "#{views} views • #{time_ago_in_words(self.updated_at).gsub('about', '')} ago"
  end
  
  def to_param
    self.uid
  end
end