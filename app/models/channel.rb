class Channel < ApplicationRecord
  has_attached_file :banner, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/channel/banner/:style/missing.png"
  # validates_attachment_presence :avatar
  validates_attachment :banner, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
end
