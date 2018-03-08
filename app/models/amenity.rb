class Amenity < ApplicationRecord
	has_many :amenity_rooms
	has_many :rooms, through: :amenity_rooms
	
	validates_presence_of :name, :description
	validates_length_of :description, minimum: 10
end
