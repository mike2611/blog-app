class Posts < ActiveRecord::Migration[7.0]
  def change
    t.integer :comments_counter
    t.integer :likes_counter
  end
end
