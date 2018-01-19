class NotificationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.authorize_confirmed.subject
  #
  def authorize_confirmed(room)
    @room = room

    mail to: "#{@room.user.email}", subject: "Your room has been successfully authorized"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.booking_created.subject
  #
  def booking_created(booked_record)
    @booking = booked_record

    mail to: "#{@booking.user.email}", subject: "Your booking status"
    
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.booking_confirmation.subject
  #
  def booking_confirmation(booking_record)
    @booking = booking_record

    mail to: "#{@booking.room.user.email}", subject: "Confirm the booking"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.booking_status.subject
  #
  def booking_status(confirmation)
    @booking = confirmation

    mail to: "#{@booking.user.email}", subject: "Confirmation of booking"
  end
end
