class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :email
      t.string :password
      t.integer :shift_id
      t.integer :status_id

      t.timestamps null: false
    end
  end
end
