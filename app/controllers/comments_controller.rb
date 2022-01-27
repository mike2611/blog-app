class CommentsController < ApplicationController
  load_and_authorize_resource
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post = Post.find(params[:post_id])
    if @comment.save
      @comment.increase_counter
      redirect_to user_posts_path, notice: 'Succesfully created new comment'
    else
      flash[:alert] = 'Error creating comment'
      render :new
    end
  end

  def destroy
    @comment.decrease_counter if @comment.destroy
    redirect_to user_posts_path
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
