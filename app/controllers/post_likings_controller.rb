class PostLikingsController < ApplicationController
  def create
    @post = Post.find(params[:liked_post])
    user = User.find(params[:liker])
    liked_post = PostLiking.create(liker: user, liked_post: @post)
    
    respond_to do |format|
      format.js { render 'like_unlike', layout: false, content_type: 'application/javascript' } 
    end
  end

  def destroy
    @post = Post.find(params[:liked_post])
    liked_post = PostLiking.where(liker: params[:liker], liked_post: params[:liked_post]).first
    liked_post.destroy

    respond_to do |format|
      format.js { render 'like_unlike', layout: false }
    end
  end
end
