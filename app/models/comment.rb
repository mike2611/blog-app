class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :text, presence: true

  def update_comments_counter
    post.comments_counter += 1
    post.save
  end
end
