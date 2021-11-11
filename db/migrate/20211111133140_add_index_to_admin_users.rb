class AddIndexToAdminUsers < ActiveRecord::Migration[6.0]
  def change
    add_index :admin_users, :name, unique: true
  end
end
