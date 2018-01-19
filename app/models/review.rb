class Review < ApplicationRecord
	belongs_to :room
	belongs_to :user
	validates_presence_of :review, :food_rating, :cleanliness_rating, :saftey_rating, :facility_rating, :locality_rating
	validates_length_of :review, minimum: 150
end
