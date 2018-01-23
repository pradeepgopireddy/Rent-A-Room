class ReviewsController < ApplicationController
	before_action :authenticate_user!
	load_and_authorize_resource
	def index
		@reviews = current_user.reviews
	end
	def create
		@review = Review.new(review_params)
		@review.user_id = current_user.id
		if @review.save
			redirect_to room_path(@review.room_id), notice: "Successfully added the review."
		end
	end
	def destroy
		@review = Review.find(params[:id])
		@review.destroy
		redirect_to room_path(@review.room_id), notice: "Successfully destroyed the review."
	end
	private
	def review_params
		params[:review].permit(:review, :food_rating, :cleanliness_rating, :saftey_rating, :facility_rating, :locality_rating, :room_id, :user_id)
	end
end
