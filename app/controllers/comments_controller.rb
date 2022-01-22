class CommentsController < ApplicationController
  def create
    @post = Post.find(comment_params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.author = current_user
    @comment.save

    respond_to do |format|
      format.js { render layout: false, content_type: 'application/javascript' }
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :post_id)
    end
end
