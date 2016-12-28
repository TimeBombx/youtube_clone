class User < ApplicationRecord
  include BCrypt
  
  has_many :videos
  
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
end
