class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients, id: :uuid do |t|
      t.decimal :quantity, null: false
      t.uuid :food_id, null: false
      t.uuid :measurement_id, null: false
      t.uuid :user_id

      t.timestamps
    end
    add_index :ingredients, :food_id
    add_index :ingredients, :measurement_id
    add_index :ingredients, :user_id
    add_index :ingredients, [:user_id, :food_id], unique: true
  end
end
