class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    current_user = User.find(params[:user_id])
    current_post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post = current_post
    if @comment.save
      redirect_to root_path, notice: 'Succesfully created new comment'
    else
      flash[:alert] = 'Error creating comment'
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
