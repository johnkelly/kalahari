class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, id: :uuid do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :auth_token, null: false
      t.string :first_name, null: false
      t.integer :sign_in_count, default: 0, null: false

      t.timestamps
    end
  end
end
