class BookingCreatedMailJob < ApplicationJob
  queue_as :default

  def perform(booking)
    # Do something later
    NotificationMailer.booking_created(booking).deliver!
	NotificationMailer.booking_confirmation(booking).deliver!
  end
end
