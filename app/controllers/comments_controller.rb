class CommentsController < ApplicationController
  def create
    micropost = Micropost.find_by(id: params[:micropost_id])
    comment_text = params[:comment][:comment]
    comment = Comment.new(content: comment_text)
    comment.micropost = micropost
    micropost.comments << comment
    current_user.comment(comment)
    render json:[]
  end

  def destroy
  end
end
