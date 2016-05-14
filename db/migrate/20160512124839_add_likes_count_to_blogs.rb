class AddLikesCountToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :likes_count, :integer, default: 0
  end
end
