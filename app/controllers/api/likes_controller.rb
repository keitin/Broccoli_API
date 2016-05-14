class Api::LikesController < ApplicationController

  skip_before_filter :verify_authenticity_token
  before_action :find_blog, only: [:create]

  def create
    @like = Like.create(like_params)
  end

  def destroy
    like = Like.find_by(like_params)
    like.destroy
  end

  def is_like
    @is_like = Like.find_by(like_params).present?
  end

  private
  def blog_params
    params.permit(:blog_id)
  end

  def like_params
    params.permit(:user_id, :blog_id).merge(blog_user_id: find_blog.user.id)
  end

  def find_blog
    blog = Blog.find(blog_params[:blog_id])
  end
end
