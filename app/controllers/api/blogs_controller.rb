class Api::BlogsController < ApplicationController

  skip_before_filter :verify_authenticity_token
  before_action :set_blog, only: [:show]

  def index
    @blogs = Blog.all
  end

  def show
  end

  def create
    @blog = Blog.save_blog(params)
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
