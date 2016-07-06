class Api::CommentsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    blog = Blog.find(comment_params[:blog_id])
    @comments = blog.comments
  end

  def create
    @comment = Comment.create(comment_params)
  end

  private
  def comment_params
    params.permit(:text, :user_id, :blog_id)
  end
end
