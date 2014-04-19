class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
    add_index :measurements, :name, unique: true
  end
end
