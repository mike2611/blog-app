class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments).limit(5)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
  end

  def create
    @post.comments_counter = 0
    @post.likes_counter = 0
    if @post.save
      redirect_to root_path, notice: 'Succesfully created new post'
    else
      flash[:alert] = 'Error creating new post'
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
