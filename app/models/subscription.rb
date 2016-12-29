class Subscription < ApplicationRecord
  belongs_to :user
  
  validates_presence_of :sub_id
  validates_presence_of :user_id
end
