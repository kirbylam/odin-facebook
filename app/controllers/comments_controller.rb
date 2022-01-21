class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    comment.author = current_user
    comment.save
    redirect_to root_path
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :post_id)
    end
end
