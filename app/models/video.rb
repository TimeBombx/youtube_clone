class Video < ApplicationRecord
  require 'securerandom'
  
  has_one :user
  has_many :comments
  
  before_save :generate_uid
  
  def generate_uid
    self.uid ||= SecureRandom.urlsafe_base64(10)
  end
end
