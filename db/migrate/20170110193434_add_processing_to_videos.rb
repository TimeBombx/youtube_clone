class AddProcessingToVideos < ActiveRecord::Migration[5.0]
  def change
    add_column :videos, :video_processing, :boolean, after: :video_meta
  end
end
