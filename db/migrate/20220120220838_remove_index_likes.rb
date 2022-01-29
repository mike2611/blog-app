class RemoveIndexLikes < ActiveRecord::Migration[6.1]
  def change
    remove_index :likes, :post_id
    remove_index :likes, :user_id
  end
end
