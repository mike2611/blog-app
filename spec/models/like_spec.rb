require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:each) { 
    @user = User.create(name: 'Test', posts_counter: 0)
    @post = @user.posts.create(title: 'test', text: 'this is a test' , comments_counter: 0, likes_counter: 0)
    @like = @post.likes.new(user_id: @user.id)
  }

  it 'update_likes_counter' do
    @like.update_likes_counter
    expect(@post.likes_counter).to eq 1
  end

end