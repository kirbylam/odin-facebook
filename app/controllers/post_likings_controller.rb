class PostLikingsController < ApplicationController
  def create
    @post = Post.find(params[:liked_post])
    user = User.find(params[:liker])
    liked_post = PostLiking.create(liker: user, liked_post: @post)
    respond_to do |format|
      # format.html { redirect_to root_path }
      format.js { render layout: false, content_type: 'application/javascript' } 
    end
  end

  def destroy
    @post = Post.find(params[:liked_post])
    liked_post = PostLiking.where(liker: params[:liker], liked_post: params[:liked_post]).first
    liked_post.destroy

    respond_to do |format|
      # format.html { redirect_to root_path }
      format.js { render 'create', layout: false }
    end
  end
end
