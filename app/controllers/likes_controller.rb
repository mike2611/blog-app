class LikesController < ApplicationRecord
  def create
    current_user = User.find(params[:user_id])
    current_post = Post.find(params[:id])
    @like = Like.new
    @like.user = current_user
    @like.post = current_post
    @like.update_likes_counter(current_post.id) if @like.save
    redirect_to [current_post]
  end
end
