class CreateMealsAppliances < ActiveRecord::Migration
  def change
    create_table :meals_appliances do |t|
      t.uuid :meal_id
      t.uuid :appliance_id

      t.timestamp
    end
    add_index :meals_appliances, :meal_id
    add_index :meals_appliances, :appliance_id
    add_index :meals_appliances, [:meal_id, :appliance_id], unique: true
  end
end
