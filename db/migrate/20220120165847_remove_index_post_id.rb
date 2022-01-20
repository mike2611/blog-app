class RemoveIndexPostId < ActiveRecord::Migration[7.0]
  def change
    remove_index :posts, :post_id
    remove_column :posts, :post_id, :integer
  end
end
