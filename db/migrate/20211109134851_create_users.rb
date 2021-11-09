class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.integer :department_id
      t.string :name
      t.string :password 
      t.string :email
      t.date :lock_end_date
      t.integer :login_error_count

      t.timestamps
    end
  end
end
