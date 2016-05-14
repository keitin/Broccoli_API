class Api::NoticesController < ApplicationController
  def index
    user = User.find(user_params[:id])
    @notices = user.notices
  end

  private
  def user_params
    params.permit(:id)
  end
end
