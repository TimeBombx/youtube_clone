class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username, null: false, limit: 20
      t.string :email, null: false
      t.string :password_hash, null: false
      
      t.text :settings, null: false
      
      t.timestamps
    end
  end
end
