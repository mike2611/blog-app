class RemoveCommentsCounterLikeCounterFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :commentsCounter, :integer
    remove_column :posts, :likeCounter, :integer
  end
end
