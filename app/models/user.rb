class User < ApplicationRecord
  include BCrypt
  
  has_many :videos
  has_many :subscriptions
  
  has_one :channel
  
  after_save :create_channel
  
  validates_presence_of :username
  validates_presence_of :password
  validates_presence_of :email
  
  validates_uniqueness_of :username
  
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  
  serialize :settings
  
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
  
  def to_param
    username.downcase
  end
  
  def create_channel
    channel = Channel.new
    channel.name = self.username
    channel.user_id = self.id
    channel.unqiue_url = self.username
    channel.save!
  end
end
