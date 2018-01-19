class Room < ApplicationRecord
	has_many :reviews
	has_many :special_prices
	has_many :bookings
	belongs_to :city
	belongs_to :user
	has_many :amenity_rooms
	has_many :amenities, through: :amenity_rooms
	mount_uploader :images, CoverUploader
	validates_presence_of :name, :description, :price, :rules, :address, :images, :city_id
	validates_numericality_of :price
	validates_length_of :description, minimum: 10

	before_save :http_request
	after_create :assign_host_role

	def http_request
		response = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{self.address}&key=AIzaSyBSd0Wq3TJkynnV7JhMgqMLtrTiFU55QEc")
		self.latitude = response.parsed_response["results"][0]["geometry"]["location"]["lat"]
		self.longitude = response.parsed_response["results"][0]["geometry"]["location"]["lng"]
	end
	def assign_host_role
		self.user.role_id = Role.second.id 
		self.user.save
	end
		
end
