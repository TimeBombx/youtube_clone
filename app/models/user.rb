class User < ApplicationRecord
  include BCrypt
  
  belongs_to :video
  belongs_to :comment
  
  serialize :settings
  
  before_save :hash_password
  
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
