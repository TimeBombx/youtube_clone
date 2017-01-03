class CreateVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :videos do |t|
      t.string :uid, null: false
      t.string :title, null: false, limit: 100
      t.text :description
      
      t.attachment :video
      t.attachment :thumbnail
      
      t.integer :views
      t.integer :likes
      t.integer :dislikes
      
      t.integer :user_id

      t.timestamps
    end
  end
end
