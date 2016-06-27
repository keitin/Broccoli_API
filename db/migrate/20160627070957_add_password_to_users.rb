class AddPasswordToUsers < ActiveRecord::Migration
  def change
    add_column :users, :crypted_password, :string
    add_column :users, :salt, :string
    add_column :users, :avatar, :string
  end
end
