class Follow < ActiveRecord::Base
  include Resonatable

  after_create :create_notice

  private
  def create_notice
    notice = Notice.where(user_id: self.target_user_id, blog_id: nil, from_user_id: self.user_id, category: :followed).first_or_initialize
    notice.status = 0
    notice.save
  end
end
