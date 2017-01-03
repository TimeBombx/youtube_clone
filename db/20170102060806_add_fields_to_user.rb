class AddFieldsToUser < ActiveRecord::Migration[5.0]
  def change
    remove_colum :users, :settings
    
    add_column :users, :channel_name, :string
    
  end
end
