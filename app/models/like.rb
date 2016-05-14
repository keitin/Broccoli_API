class Like < ActiveRecord::Base
  belongs_to :blog, counter_cache: :likes_count
  belongs_to :user
  belongs_to :blog_user, class_name: 'User', foreign_key: 'blog_user_id'
end
