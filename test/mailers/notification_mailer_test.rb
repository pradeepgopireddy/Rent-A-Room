require 'test_helper'

class NotificationMailerTest < ActionMailer::TestCase
  test "authorize_confirmed" do
    mail = NotificationMailer.authorize_confirmed
    assert_equal "Authorize confirmed", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "booking_created" do
    mail = NotificationMailer.booking_created
    assert_equal "Booking created", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "booking_confirmation" do
    mail = NotificationMailer.booking_confirmation
    assert_equal "Booking confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "booking_status" do
    mail = NotificationMailer.booking_status
    assert_equal "Booking status", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
