class Video < ApplicationRecord
  require 'securerandom'
  include ActionView::Helpers::DateHelper
  
  belongs_to :channel
  
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