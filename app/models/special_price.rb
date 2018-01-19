class SpecialPrice < ApplicationRecord
	belongs_to :room
	validates_presence_of :room_id, :start_date, :end_date, :price
	validate :check_date, on: :create

	def check_date
		if self.start_date < Date.today
			self.errors.add(:base, "your start date can't be past")
		elsif self.end_date < self.start_date
			self.errors.add(:base, "Your end date must be greaterthan start date")
		end
	end
end
