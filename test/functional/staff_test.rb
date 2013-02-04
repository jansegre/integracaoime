require 'test_helper'

class StaffTest < ActionMailer::TestCase
  test "feedback_email" do
    mail = Staff.feedback_email
    assert_equal "Feedback email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "contact_email" do
    mail = Staff.contact_email
    assert_equal "Contact email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
