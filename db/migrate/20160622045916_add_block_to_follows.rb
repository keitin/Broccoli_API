class AddBlockToFollows < ActiveRecord::Migration
  def change
    add_column :follows, :block, :boolean, default: 0
  end
end
