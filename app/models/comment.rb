class Comment < ActiveRecord::Base
  
  belongs_to :blog, counter_cache: :comments_count
  belongs_to :user

  after_create :create_notice

  private
  def create_notice
    notice = Notice.where(user_id: self.blog.user.id, blog_id: self.blog_id, from_user_id: self.user_id, category: :comment).first_or_initialize
    notice.status = 0
    notice.save
  end
end
