require 'test_helper'

describe Kiitos::KiitosMailer do
  describe '.received_kiito_notification' do
    before do
      @message = 'This is a message.'
      Kiitos::KiitosMailer
        .received_kiito_notification('to@example.com', @message).deliver
    end

    it 'sends a received kiito notification email' do
      ActionMailer::Base.deliveries.count.must_equal 1, "Email wasn't sent"
    end

    it 'sends message details' do
      message = ActionMailer::Base.deliveries.last
      message.body.raw_source.must_include @message
      message.body.raw_source.must_include 'Go to your dashboard.'
    end
  end
end
