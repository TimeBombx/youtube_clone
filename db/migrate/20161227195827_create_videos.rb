class CreateVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :videos do |t|
      t.string :uid, null: false
      t.string :title, null: false, limit: 100
      t.string :video_loc, null: false
      t.text :description, null: false
      
      t.string :thumbnail
      
      t.integer :views
      t.integer :likes
      t.integer :dislikes
      
      t.integer :user_id
      
      t.timestamps
    end
  end
end
