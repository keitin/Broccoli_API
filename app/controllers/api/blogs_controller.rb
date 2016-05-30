class Api::BlogsController < ApplicationController

  skip_before_filter :verify_authenticity_token
  before_action :set_blog, only: [:show]

  def index
    if params[:user_id] == "nil"
      @blogs = Blog.all
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

  def following
    user = User.find(params[:id])
    @blogs = Blog.where(user_id: [user.following, user].flatten).order("created_at DESC").page(params[:page]).per(3)
  end

  def search
    @blogs = Blog.where("title like '%#{search_params[:keyword]}%'").page(search_params[:page]).per(3)
  end

  private
  def image_params
    params.permit(:image)
  end

  def search_params
    params.permit(:keyword, :page)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.permit(:title, :sentence, :image)
  end
end
