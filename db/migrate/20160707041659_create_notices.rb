class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.integer :blog_id
      t.integer :user_id
      t.integer :from_user_id
      t.integer :category
      t.integer :status
      t.timestamps null: false
    end
  end
end
