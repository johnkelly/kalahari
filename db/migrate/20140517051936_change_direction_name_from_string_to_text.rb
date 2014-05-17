class ChangeDirectionNameFromStringToText < ActiveRecord::Migration
  def change
    change_column :directions, :name, :text
  end
end
