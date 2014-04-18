class CreateUsersAppliances < ActiveRecord::Migration
  def change
    create_table :users_appliances, id: :uuid do |t|
      t.uuid :user_id
      t.uuid :appliance_id

      t.timestamp
    end
    add_index :users_appliances, :user_id
    add_index :users_appliances, :appliance_id
    add_index :users_appliances, [:user_id, :appliance_id], unique: true
  end
end
