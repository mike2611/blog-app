class RemoveIndex < ActiveRecord::Migration[7.0]
  def change
    remove_index :posts, :user_id
  end
end
