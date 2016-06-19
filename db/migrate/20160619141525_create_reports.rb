class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :user_id
      t.integer :blog_id
      t.integer :report_type
      t.timestamps null: false
    end
  end
end
