class AddVisibilityToVideos < ActiveRecord::Migration[5.0]
  def change
    add_column :videos, :visibility, :string, after: :channel_id, default: 'public'
  end
end
