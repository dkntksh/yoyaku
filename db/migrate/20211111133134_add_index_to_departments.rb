class AddIndexToDepartments < ActiveRecord::Migration[6.0]
  def change
    add_index :departments, :department_code, unique: true
  end
end
