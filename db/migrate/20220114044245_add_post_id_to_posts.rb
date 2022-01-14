class AddPostIdToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :post_id, :string
    add_index :posts, :post_id
  end
end
