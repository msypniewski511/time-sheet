class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :nazwa

      t.timestamps null: false
    end
  end
end
