class User < ActiveRecord::Base
  has_many :blogs
  include Resonatable
end
