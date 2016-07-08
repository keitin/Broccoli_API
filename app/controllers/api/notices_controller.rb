class Api::NoticesController < ApplicationController
  
  skip_before_filter :verify_authenticity_token

  def index
    user = User.find(user_params[:id])
    @notices = user.notices.order("created_at DESC").page(params[:page]).per(20)
  end

  def update
    notice = Notice.find(notice_params[:id])
    notice.update(status: Notice.statuses[:read])
  end

  def count
    user = User.find(user_params[:id])
    @count = Notice.where(status: Notice.statuses[:unread], user_id: user).count
  end

  private
  def user_params
    params.permit(:id)
  end

  def notice_params
    params.permit(:id)
  end
end
