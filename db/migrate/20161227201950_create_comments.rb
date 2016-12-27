class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :user_id, null: false
      t.integer :video_id, null: false
      
      t.string :body, null: false, limit: 240
      
      t.timestamps
    end
  end
end
