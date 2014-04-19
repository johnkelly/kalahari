class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods, id: :uuid do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :foods, :name, unique: true
  end
end
