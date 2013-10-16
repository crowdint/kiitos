require 'test_helper'

describe Kiitos::EmailService do
  let(:email_service) { Kiitos::EmailService.new 'test@example.com', 'Test Message' }

  describe '#send_notification' do
    it 'should sends an email' do
      ActionMailer::Base.deliveries = []
      email_service.send_notification
      ActionMailer::Base.deliveries.count.must_equal 1
    end
  end
end
