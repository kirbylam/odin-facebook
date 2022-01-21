class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @comment = Comment.new
    @post = Post.new
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.author = current_user 

    if post.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
    def post_params
      params.require(:post).permit(:body)
    end
end
