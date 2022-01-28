module Api
  class PostsController < ApplicationController
    before_action :authenticate_user!
    def index
      @posts = Post.all.order('created_at')
      render json: { success: true, data: { posts: @posts }, status: :ok }
    end

    def create
      @post = current_user.posts.new(post_params)
      @post.increase_counter if @post.save
    end

    private

    def post_params
      params.require(:post).permit(:title, :text, :comments_counter, :likes_counter)
    end
  end
end
