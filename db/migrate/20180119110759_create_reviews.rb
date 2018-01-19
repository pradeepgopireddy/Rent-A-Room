class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.text :review
      t.integer :food_rating
      t.integer :cleanliness_rating
      t.integer :saftey_rating
      t.integer :facility_rating
      t.integer :locality_rating
      t.integer :room_id
      t.integer :user_id

      t.timestamps
    end
  end
end
