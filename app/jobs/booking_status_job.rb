class BookingStatusJob < ApplicationJob
  queue_as :default

  def perform(booking)
    # Do something later
    NotificationMailer.booking_status(booking).deliver!
  end
end
