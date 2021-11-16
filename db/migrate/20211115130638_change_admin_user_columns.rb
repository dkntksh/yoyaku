class ChangeAdminUserColumns < ActiveRecord::Migration[6.0]
  def change
    add_column :admin_users, :login_error_count, :integer
    add_column :admin_users, :lock_datetime_to, :datetime 
  end
end
