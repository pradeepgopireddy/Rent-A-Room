class RoomsController < ApplicationController
	before_action :authenticate_user!, except: [:index]
	load_and_authorize_resource
	#url = localhost:3000/rooms/index
	#uri = /rooms/index
	#path = rooms_path
	#HTTP method = GET
	def index
		 @rooms = Room.where("is_authorized = ?", true).paginate(:page => params[:page], :per_page => 3)
		#@rooms = Room.lessthan_1000

	end
	#url = localhost:3000/room/new
	#uri = /room/new
	#path = new_room_path
	#HTTP method = GET
	def new
		@room = Room.new
	end
	#AIzaSyBSd0Wq3TJkynnV7JhMgqMLtrTiFU55QEc
	def create
		@room = Room.new(room_params)
		@room.user_id = current_user.id
		binding.pry
		if @room.save
			binding.pry
			redirect_to rooms_path, notice: "Successfully added the room"
		else
			render action: 'new'
		end
	end
	def show
		@room = Room.find(params[:id])
		@booking = Booking.new
		@special_price = SpecialPrice.new
		@review = Review.new
	end

	def edit
		@room = Room.find(params[:id])
	end

	def update
		@room = Room.find(params[:id])
		
		if @room.update_attributes(room_params)
			AuthorizationMailJob.perform_later(@room)
			redirect_to room_path(@room.id), notice: "Successfully updated the room details "
		else
			render action: 'edit'
		end
	end

	def destroy
		@room = Room.find(params[:id])
		@room.destroy
		redirect_to rooms_path, notice: "Successfully removed your room record"
	end

	def my_rooms
		@rooms = current_user.rooms
	end
	def unauthorized_rooms
		@rooms = Room.where(is_authorized: false)
	end

	private
	def room_params
		params[:room].permit(:name, :description, :price, :rules, :address, :images, :latitude, :longitude, :city_id, :is_authorized, amenity_ids:[])
	end
end
