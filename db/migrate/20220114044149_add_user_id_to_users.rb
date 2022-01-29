class AddUserIdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :user_id, :string
    add_index :users, :user_id
  end
end
