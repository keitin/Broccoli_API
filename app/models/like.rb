class Like < ActiveRecord::Base
  belongs_to :blog, counter_cache: :likes_count
  belongs_to :user
  belongs_to :blog_user, class_name: 'User', foreign_key: 'blog_user_id'

  after_create :create_notice

  private
  def create_notice
    notice = Notice.where(user_id: self.blog.user.id, blog_id: self.blog_id, from_user_id: self.user_id, category: :like).first_or_initialize
    notice.status = 0
    notice.save
  end
end
