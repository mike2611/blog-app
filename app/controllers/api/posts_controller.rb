module Api
  class PostsController < ApplicationController
    before_action :authenticate_user!
    def index
      @posts = Post.all.order('created_at')
      render json: { success: true, data: { posts: @posts }, status: :ok }
    end
  end
end
