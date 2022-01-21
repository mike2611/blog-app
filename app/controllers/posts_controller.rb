class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(user_id: params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id: params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    current_user = User.find(params[:user_id])
    @post = Post.new(post_params)
    @post.user = current_user
    @post.comments_counter = 0
    @post.likes_counter = 0
    if @post.save
      redirect_to root_path, notice: 'Succesfully created new post'
    else
      flash[:alert] = "Error creating new post"
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
