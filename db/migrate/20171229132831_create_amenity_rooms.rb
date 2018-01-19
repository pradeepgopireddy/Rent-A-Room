class CreateAmenityRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :amenity_rooms do |t|
      t.integer :amenity_id
      t.integer :room_id

      t.timestamps
    end
  end
end
