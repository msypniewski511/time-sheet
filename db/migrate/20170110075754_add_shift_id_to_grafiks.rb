class AddShiftIdToGrafiks < ActiveRecord::Migration
  def change
    add_column :grafiks, :shift_id, :integer
  end
end
