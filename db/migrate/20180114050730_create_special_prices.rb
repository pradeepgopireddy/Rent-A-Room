class CreateSpecialPrices < ActiveRecord::Migration[5.1]
  def change
    create_table :special_prices do |t|
      t.integer :room_id
      t.date :start_date
      t.date :end_date
      t.integer :price

      t.timestamps
    end
  end
end
