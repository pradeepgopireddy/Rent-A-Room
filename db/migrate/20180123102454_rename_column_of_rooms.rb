class RenameColumnOfRooms < ActiveRecord::Migration[5.1]
  def change
  	change_column :rooms, :address, :text
  end
end
