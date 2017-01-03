class RenameUserIdToChannelId < ActiveRecord::Migration[5.0]
  def change
    rename_column :videos, :user_id, :channel_id
  end
end
