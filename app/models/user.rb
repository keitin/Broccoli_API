class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessor :password
  attr_accessor :password_confirmation

  mount_uploader :avatar, ImageUploader

  has_many :blogs
  has_many :notices
  validates :email, uniqueness: true


  include Resonatable

  def following_without_blocking
    blocking_user_ids = Follow.where(user_id: self.id, block: true).pluck(:target_user_id)
    self.following.where.not(id: blocking_user_ids)
  end

  def following_without_blocked
    blocked_user_ids = Follow.where(target_user_id: self.id, block: true).pluck(:user_id)
    self.following.where.not(id: blocked_user_ids)
  end

  def following_without_block
    blocking_user_ids = Follow.where(user_id: self.id, block: true).pluck(:target_user_id)
    blocked_user_ids = Follow.where(target_user_id: self.id, block: true).pluck(:user_id)
    block_user_ids = (blocking_user_ids + blocked_user_ids).uniq
    self.following.where.not(id: block_user_ids)
  end
end
