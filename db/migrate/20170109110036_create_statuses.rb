class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :nazwa
      t.integer :uprawnienia

      t.timestamps null: false
    end
  end
end
