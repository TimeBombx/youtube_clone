class AddStepToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :step, :integer, after: :body
  end
end
