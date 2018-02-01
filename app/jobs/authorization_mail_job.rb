class AuthorizationMailJob < ApplicationJob
  queue_as :default

  def perform(room)
    # Do something later
    NotificationMailer.authorize_confirmed(room).deliver!
  end
end
