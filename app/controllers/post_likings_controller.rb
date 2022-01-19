class PostLikingsController < ApplicationController
  def create
    post = Post.find(params[:liked_post])
    user = User.find(params[:liker])
    liked_post = PostLiking.create(liker: user, liked_post: post)
    redirect_to root_path
  end

  def destroy
    liked_post = PostLiking.where(liker: params[:liked_post], liked_post: params[:liker]).first
    liked_post.destroy
    redirect_to root_path
  end
end
