class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_comments_counter(post_id)
    post = Post.find(post_id)
    post.comments_counter += 1
    post.save
  end
end
