class RemoveIndexComments < ActiveRecord::Migration[6.1]
  def change
    remove_index :comments, :post_id
    remove_index :comments, :user_id
  end
end
