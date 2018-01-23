
class Booking < ApplicationRecord
	belongs_to :user
	belongs_to :room
	validates_presence_of :start_date, :end_date
	validate :check_valid_dates, on: :create
	validate :check_booking_dates, on: :create
	validate :total_price, on: :create
	after_create :send_email_to_host_guest
	after_update :confirmation_mail_to_guest

	def check_valid_dates
		if self.start_date < Date.today
			self.errors.add(:error, "Your start date cant be past")
		end
		if self.end_date < self.start_date
			self.errors.add(:error, "Your end date must be greater than start date")
		end
	end
	def check_booking_dates
		
		Booking.where("room_id = ? AND end_date >= ?", self.room_id, Date.today).each do |past_booking|
			self.check(past_booking)
		end
	end
	def check(past_booking)
		present_booking = (self.start_date..self.end_date).to_a
		(past_booking.start_date..past_booking.end_date).to_a.each do |booked_date|
				if present_booking.include? booked_date
					self.errors.add(:error, "Room is not available at this present booking dates")
				end
				break
			end
	end
	def total_price
		if self.room.special_prices.any?
			present_booking = (self.start_date..self.end_date).to_a
			special_price_dates = SpecialPrice.where("room_id = ?", self.room_id)
			self.price = 0
			special_price_dates.each do |special_price|
				present_booking.each do |date|
					if (special_price.start_date..special_price.end_date).to_a.include? date
						self.price += special_price.price
					else
						self.price += self.room.price
					end
				end
			end
		else
			self.price = self.room.price * (self.start_date..self.end_date).to_a.length
		end
	end

	def send_email_to_host_guest
		NotificationMailer.booking_created(self).deliver!
		NotificationMailer.booking_confirmation(self).deliver!
	end

	def confirmation_mail_to_guest
		NotificationMailer.booking_status(self).deliver!
	end
end
