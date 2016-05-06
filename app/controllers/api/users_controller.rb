class Api::UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    user = User.where(facebook_id: user_params[:facebook_id]).first_or_initialize
    user = user.update(user_params)
    @user = User.find_by(facebook_id: user_params[:facebook_id])
  end

  def follow
    user = User.find(follow_params[:id])
    target_user = User.find(follow_params[:target_user_id])
    user.follow(target_user)
  end

  def unfollow
    user = User.find(follow_params[:id])
    target_user = User.find(follow_params[:target_user_id])
    user.unfollow(target_user)
  end

  def following
    user = User.find(follow_params[:id])
    @follows = user.following
  end

  def is_follow
    user = User.find(follow_params[:id])
    target_user = User.find(follow_params[:target_user_id])
    @is_follow = user.following?(target_user)
  end

  private
  def user_params
    params.permit(:name, :image_url, :email, :facebook_id, :token)
  end

  def follow_params
    params.permit(:id, :target_user_id)
  end
end
