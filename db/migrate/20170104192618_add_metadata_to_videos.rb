class AddMetadataToVideos < ActiveRecord::Migration[5.0]
  def change
    change_column :videos, :title, :string, default: "default video title"
    add_column :videos, :video_meta, :string, after: :channel_id
  end
end
