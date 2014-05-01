class AddMlToMeasurements < ActiveRecord::Migration
  def change
    add_column :measurements, :mL, :decimal, null: false
  end
end
