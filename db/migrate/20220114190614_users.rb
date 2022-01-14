class Users < ActiveRecord::Migration[7.0]
  def change
    t.integer :posts_counter
  end
end
