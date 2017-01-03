class RenameSubIdToChannelId < ActiveRecord::Migration[5.0]
  def change
    rename_column :subscriptions, :sub_id, :channel_id
  end
end
