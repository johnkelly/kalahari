class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
