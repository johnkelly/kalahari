class CreateDirections < ActiveRecord::Migration
  def change
    create_table :directions, id: :uuid do |t|
      t.uuid :meal_id, null: false
      t.integer :position, null: false
      t.string :name, null: false

      t.timestamps
    end

    add_index :directions, :meal_id
  end
end
