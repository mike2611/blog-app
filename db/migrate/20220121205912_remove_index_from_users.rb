class RemoveIndexFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_index :users, :user_id
    remove_column :users, :user_id, :integer
  end
end
