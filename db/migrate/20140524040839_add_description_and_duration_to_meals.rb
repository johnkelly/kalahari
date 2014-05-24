class AddDescriptionAndDurationToMeals < ActiveRecord::Migration
  def change
    add_column :meals, :duration, :integer
    add_column :meals, :description, :text
  end
end
