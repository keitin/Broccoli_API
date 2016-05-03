class Blog < ActiveRecord::Base
  has_many :materials
  has_many :images, ->{ order("order DESC") }
  mount_uploader :image, ImageUploader
end
