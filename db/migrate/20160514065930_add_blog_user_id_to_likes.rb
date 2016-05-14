class AddBlogUserIdToLikes < ActiveRecord::Migration
  def change
    add_column :likes, :blog_user_id, :integer
  end
end
