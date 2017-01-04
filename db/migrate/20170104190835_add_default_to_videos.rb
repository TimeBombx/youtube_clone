class AddDefaultToVideos < ActiveRecord::Migration[5.0]
  def change
    change_column :videos, :views, :integer, default: 0
    change_column :videos, :likes, :integer, default: 0
    change_column :videos, :dislikes, :integer, default: 0
  end
end
