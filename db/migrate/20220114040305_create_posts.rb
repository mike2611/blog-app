class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :text
      t.integer :commentsCounter
      t.integer :likeCounter

      t.timestamps
    end
  end
end
