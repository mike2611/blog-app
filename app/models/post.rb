class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  validates :text, length:, presence: true
  validates :title, {minimum: 3, maximum: 250}, presence: true
  validates :comments_counter, numericality: {greater_than_or_equal_to: 0 , only_integer: true}
  validates :likes_counter, numericality: {greater_than_or_equal_to: 0 , only_integer: true}

  def update_posts_counter(user_id)
    user = User.find(user_id)
    user.posts_counter += 1
    user.save
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
