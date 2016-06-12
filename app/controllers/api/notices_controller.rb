class Api::NoticesController < ApplicationController
  def index
    user = User.find(user_params[:id])
    @notices = user.notices.order("created_at DESC").page(params[:page]).per(20)
  end

  private
  def user_params
    params.permit(:id)
  end
end
