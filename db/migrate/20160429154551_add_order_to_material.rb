class AddOrderToMaterial < ActiveRecord::Migration
  def change
    add_column :materials, :order, :integer
  end
end

