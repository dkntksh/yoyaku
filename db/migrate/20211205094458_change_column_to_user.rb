class ChangeColumnToUser < ActiveRecord::Migration[6.0]
  def change
    change_column_null :users, :department_id, false
  end
end
