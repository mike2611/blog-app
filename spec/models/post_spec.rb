require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) do
    @user = User.new
    @user.name = 'Test'
    @user.photo = 'https://thisisaurl.com'
    @user.bio = 'This is the bio of Test user'
    @user.posts_counter = 0
    @post = @user.posts.new(title: 'test', text: 'this is a test', comments_counter: 0, likes_counter: 0)
  end

  it 'text should be present' do
    @post.text = nil
    expect(@post).to_not be_valid
  end

  it 'title should be present' do
    @post.title = nil
    expect(@post).to_not be_valid
  end

  it 'title should not be larger than 250' do
    @post.title = 'a' * 251
    expect(@post).to_not be_valid
  end

  it 'likes_counter should >= 0' do
    @post.likes_counter = -1
    expect(@post).to_not be_valid
  end

  it 'comments_counter should >= 0' do
    @post.comments_counter = -1
    expect(@post).to_not be_valid
  end

  it 'recent_comments method show the 5 most recent comments' do
    @user.save
    @post.comments.create(text: 'test1', user_id: @user.id)
    @post.comments.create(text: 'test2', user_id: @user.id)
    @post.comments.create(text: 'test3', user_id: @user.id)
    @post.comments.create(text: 'test4', user_id: @user.id)
    @post.comments.create(text: 'test5', user_id: @user.id)
    @post.save

    expect(@post.recent_comments.length).to eq 5
  end

  it 'update_posts_counter' do
    @user.save
    @post.update_posts_counter
    expect(@user.posts_counter).to eq 1
  end
end
