class User < ActiveRecord::Base
  has_many :blogs
  has_many :notices, class_name: 'Like', foreign_key: 'blog_user_id'
  include Resonatable
end
