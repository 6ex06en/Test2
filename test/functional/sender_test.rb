require 'test_helper'

class SenderTest < ActionMailer::TestCase
  test "map_to_email" do
    mail = Sender.map_to_email
    assert_equal "Map to email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
