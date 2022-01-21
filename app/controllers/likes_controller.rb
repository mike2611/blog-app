class LikesController < ApplicationRecord
  def create
    current_user = User.find(params[:user_id])
    current_post = Post.find(params[:id])
    @like = Like.new
    @like.user = current_user
    @like.post = current_post
    if @like.save
      flash[:notice] = 'Succesfully added new like'
      @like.update_likes_counter(current_post.id)
    else
      flash[:alert] = 'Error adding new like'
    end
    redirect_to [current_post]
  end
end
