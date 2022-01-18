class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_likes_counter(post_id)
    post = Post.find(post_id)
    post.likes_counter += 1
    post.save
  end
end
