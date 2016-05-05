class Api::BlogsController < ApplicationController

  skip_before_filter :verify_authenticity_token
  before_action :set_blog, only: [:show]

  def index
    if params[:user_id] == "nil"
      @blogs = Blog.order("created_at DESC").page(params[:page]).per(3)
    else
      user = User.find(params[:user_id])
      @blogs = user.blogs.order("created_at DESC").page(params[:page]).per(3)
    end

  end

  def show
  end

  def create
    @blog = Blog.save_blog(params)
    @user = @blog.user
  end

  private
  def image_params
    params.permit(:image)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.permit(:title, :sentence, :image)
  end
end
