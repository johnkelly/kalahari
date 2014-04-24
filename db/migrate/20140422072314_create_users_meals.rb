class CreateUsersMeals < ActiveRecord::Migration
  def change
    create_table :users_meals, id: :uuid do |t|
      t.uuid :user_id, null: false
      t.uuid :meal_id, null: false
      t.datetime :scheduled_at

      t.timestamps
    end

    add_index :users_meals, :meal_id
    add_index :users_meals, :user_id
    add_index :users_meals, [:meal_id, :user_id]
  end
end
