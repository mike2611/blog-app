class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :jwt_authenticatable,
         jwt_revocation_strategy: JwtDenylist
  has_many :posts
  has_many :likes
  has_many :comments

  validates :name, presence: true
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  def recent_posts
    posts.includes(:comments).order(created_at: :desc).last(3)
  end

  def admin?
    role == 'admin'
  end
end
