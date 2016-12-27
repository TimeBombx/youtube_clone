class Comment < ApplicationRecord
  has_one :user
  belongs_to :video
end
