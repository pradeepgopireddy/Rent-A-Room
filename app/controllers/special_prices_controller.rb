class SpecialPricesController < ApplicationController
	before_action :authenticate_user!
	load_and_authorize_resource
	def index
		@special_prices = SpecialPrice.all 
	end

	def new
		@room = Room.find(params[:room_id])
		@special_price = SpecialPrice.new
	end
	def create
		@special_price = SpecialPrice.new(special_price_params)
		@special_price.room_id = params[:room_id]
		binding.pry
		if @special_price.save
			redirect_to room_path(@special_price.room_id), notice: "Successfully created the special price"
		else
			render action: 'new'
		end
	end
	def show
		@room = Room.find(params[:room_id])
		@special_price = SpecialPrice.find(params[:id])
	end
	def edit
		@room = Room.find(params[:room_id])
		@special_price = SpecialPrice.find(params[:id])
	end
	def update
		@room = Room.find(params[:room_id])
		@special_price = SpecialPrice.find(params[:id])
		if @special_price.update_attributes(special_price_params)
			redirect_to room_path(@room.id), notice: "Successfully updated the special price"
		else
			render action: 'edit'
		end
	end
	def destroy
		@room = Room.find(params[:room_id])
		@special_price = SpecialPrice.find(params[:id])
		@special_price.destroy
		redirect_to special_prices_path, notice: "Successfully destroyed the special price"
	end

	private

	def special_price_params
		params[:special_price].permit(:start_date, :end_date, :price, :room_id)
	end
end
