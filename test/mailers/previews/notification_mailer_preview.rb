# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notification_mailer/authorize_confirmed
  def authorize_confirmed
    NotificationMailer.authorize_confirmed
  end

  # Preview this email at http://localhost:3000/rails/mailers/notification_mailer/booking_created
  def booking_created
    NotificationMailer.booking_created
  end

  # Preview this email at http://localhost:3000/rails/mailers/notification_mailer/booking_confirmation
  def booking_confirmation
    NotificationMailer.booking_confirmation
  end

  # Preview this email at http://localhost:3000/rails/mailers/notification_mailer/booking_status
  def booking_status
    NotificationMailer.booking_status
  end

end
