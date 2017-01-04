class Channel < ApplicationRecord
  has_many :videos
  belongs_to :user
  
  has_attached_file :banner, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/channel/banner/:style/missing.png"
  validates_attachment :banner, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
  
  def channel_name
    unqiue_url || name
  end
  
  def to_param
    channel_name
  end
end
