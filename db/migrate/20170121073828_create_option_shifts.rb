class CreateOptionShifts < ActiveRecord::Migration
  def change
    create_table :option_shifts do |t|
      t.string :option
      t.string :color
      t.string :description

      t.timestamps null: false
    end
  end
end
