class CreateGrafiks < ActiveRecord::Migration
  def change
    create_table :grafiks do |t|
      t.string :nazwa
      t.string :dane

      t.timestamps null: false
    end
  end
end
