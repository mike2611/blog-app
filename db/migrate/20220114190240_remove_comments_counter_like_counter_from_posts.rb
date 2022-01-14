class RemoveCommentsCounterLikeCounterFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :commentsCounter, :integer
    remove_column :posts, :likeCounter, :integer
  end
end
