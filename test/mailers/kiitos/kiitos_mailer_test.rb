require 'test_helper'

describe Kiitos::KiitosMailer do
  describe '.received_kiito_notification' do
    before do
      @message = Kiitos::Message.new message: 'This is a message.'
      Kiitos::KiitosMailer
        .received_kiito_notification('to@example.com', @message).deliver
    end

    it 'sends a received kiito notification email' do
      assert ActionMailer::Base.deliveries.count == 1, "Email wasn't sent"
    end

    it 'sends message details' do
      message = ActionMailer::Base.deliveries.last
      assert(
        message.body.raw_source.include?(@message.message),
        'Did not include the message.'
      )
      assert(
        message.body.raw_source.include?('Go to your dashboard.'),
        'Did not include link to dashboard'
      )
    end
  end
end
