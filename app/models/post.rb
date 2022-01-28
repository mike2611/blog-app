class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :text, presence: true
  validates :title, length: { minimum: 3, maximum: 250 }, presence: true
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  def increase_counter
    user.posts_counter = 0 if user.posts_counter.nil?
    user.posts_counter += 1
    user.save
  end

  def decrease_counter
    return if user.posts_counter <= 0 || user.posts_counter.nil?

    user.posts_counter -= 1
    user.save
  end

  def recent_comments
    comments.order(created_at: :desc).includes(:user).limit(5)
  end
end
