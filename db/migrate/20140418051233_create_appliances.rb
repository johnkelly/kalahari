class CreateAppliances < ActiveRecord::Migration
  def change
    create_table :appliances, id: :uuid do |t|
      t.string :kind

      t.timestamps
    end
  end
end
