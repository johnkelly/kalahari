class AddMealIdToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :meal_id, :uuid
    add_index :ingredients, :meal_id
  end
end
