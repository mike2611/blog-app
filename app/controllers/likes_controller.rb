class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.new(user: current_user)
    if @like.save
      @like.increase_counter
      flash[:notice] = 'Succesfully added new like'
    else
      flash[:alert] = 'Error adding new like'
    end
  end
end
