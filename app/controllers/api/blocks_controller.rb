class Api::BlocksController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    user = User.find(block_params[:id])
    target_user = User.find(block_params[:target_user_id])
    follow = Follow.find_or_create_by(user_id: user.id, target_user_id: target_user.id)
    follow.update(block: true)
  end

  def destroy
    user = User.find(block_params[:user_id])
    target_user = User.find(block_params[:target_user_id])
    follow = Follow.find_by(user_id: user.id, target_user_id: target_user.id)
    follow.update(block: false)
  end

  def is_blocked
    user = User.find(block_params[:id])
    target_user = User.find(block_params[:target_user_id])
    @is_blocked = Follow.exists?(user_id: target_user, target_user_id: user, block: true)
    @is_blocking = Follow.exists?(user_id: user, target_user_id: target_user, block: true)
  end

  private
  def block_params
    params.permit(:id, :target_user_id, :user_id)
  end
end
