module Api
  class CommentsController < ApplicationController
    before_action :authenticate_user!
    def index
      @post = Post.includes(:comments).find_by(id: params[:post_id])
      render json: { success: true, data: { comments: @post.comments }, status: :ok }
    end

    def create
      @comment = Comment.new(comment_params)
      @comment.user = current_user
      @comment.post = Post.find(params[:post_id])
      @comment.save
    end

    private

    def comment_params
      params.require(:comment).permit(:text)
    end
  end
end