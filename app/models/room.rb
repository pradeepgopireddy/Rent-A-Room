class Room < ApplicationRecord
	has_many :reviews, :dependent => :destroy
	has_many :special_prices, :dependent => :destroy
	has_many :bookings, :dependent => :destroy
	belongs_to :city
	belongs_to :user
	has_many :amenity_rooms
	has_many :amenities, through: :amenity_rooms
	mount_uploader :images, CoverUploader
	validates_presence_of :name, :description, :price, :rules, :address, :images, :city_id
	validates_numericality_of :price, greater_than: 0
	validates_length_of :description, minimum: 10

	before_save :http_request
	after_create :assign_host_role

	def http_request
		begin
		response = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{self.address}&key=AIzaSyBSd0Wq3TJkynnV7JhMgqMLtrTiFU55QEc")
		self.latitude = response.parsed_response["results"][0]["geometry"]["location"]["lat"]
		self.longitude = response.parsed_response["results"][0]["geometry"]["location"]["lng"]
		rescue Exception => e
			self.latitude = 0
			self.longitude = 0
		end
	end
	def assign_host_role
		if self.user.role? "admin"
			self.user.role_id = Role.first.id
		else
			self.user.role_id = Role.second.id 
			self.user.save
		end
	end
	scope :lessthan_1000, -> {where("price <= ? AND is_authorized = ?", 1000, true)}
	scope :between_1000_to_3000, -> {where("price > ? AND price <= ? AND is_authorized = ?", 1000,3000, true)}
	scope :above_3000, -> {where("price > ? AND is_authorized = ?",3000,true)}

end
