require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.new
  user.name = "Test"
  user.photo = "https://thisisaurl.com"
  user.bio = "This is the bio of Test user"
  user.posts_counter = 0

  post = Post.new
  post.title = "This is a post"
  post.text = "This is a test"
  post.user_id = 1
  post.comments_counter = 0
  post.likes_counter = 0

  before { user.save, post.save }

  it 'name should be present' do
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'posts_counter should >= 0' do
    user.recent_posts
    
    @u.posts_counter = nil
  end

end