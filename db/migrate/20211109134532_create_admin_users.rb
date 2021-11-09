class CreateAdminUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :admin_users do |t|
      t.integer :department_id
      t.string :name
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
