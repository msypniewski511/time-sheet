class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.string :nazwa
      t.integer :grafik_id

      t.timestamps null: false
    end
  end
end
