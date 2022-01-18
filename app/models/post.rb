class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  def update_posts_counter(user_id)
    user = User.find(user_id)
    user.posts_counter += 1
    user.save
  end
  
  def recent_comments
    comments.order(text:, created_at: :desc).limit(5)
  end

end
