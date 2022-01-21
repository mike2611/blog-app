require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:each) do
    @user = User.create(name: 'Test', posts_counter: 0)
    @post = @user.posts.create(title: 'test', text: 'this is a test', comments_counter: 0, likes_counter: 0)
    @comment = @post.comments.new(text: 'this is a test', user_id: @user.id)
  end

  it 'text should be present' do
    @comment.text = nil
    expect(@comment).to_not be_valid
  end

  it 'update_likes_counter' do
    @comment.update_comments_counter
    expect(@post.comments_counter).to eq 1
  end
end
