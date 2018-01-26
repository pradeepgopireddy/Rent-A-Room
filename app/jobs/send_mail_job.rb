class SendMailJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    SendMailJob.perform_later 
  end
end
