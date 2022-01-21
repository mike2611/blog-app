require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) { 
    @user = User.new
    @user.name = "Test"
    @user.photo = "https://thisisaurl.com"
    @user.bio = "This is the bio of Test user"
    @user.posts_counter = 0 
  }

  it 'name should be present' do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'posts_counter should >= 0' do
    @user.posts_counter = -1
    expect(@user).to_not be_valid
  end

  it 'posts_counter should be an integer' do
    @user.posts_counter = 'zero'
    expect(@user).to_not be_valid
  end

  it 'show the 3 most recent post' do
    @user.posts.new(title: 'test1', text: 'test', comments_counter: 0, likes_counter: 0)
    @user.posts.new(title: 'test2', text: 'test', comments_counter: 0, likes_counter: 0)
    @user.posts.new(title: 'test3', text: 'test', comments_counter: 0, likes_counter: 0)
    @user.save

    expect(@user.recent_posts[0].title).to eq 'test3'
    expect(@user.recent_posts[1].title).to eq 'test2'
    expect(@user.recent_posts[2].title).to eq 'test1'
  end

end