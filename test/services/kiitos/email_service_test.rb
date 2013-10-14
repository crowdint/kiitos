require 'test_helper'

describe Kiitos::EmailService do

  before do
    message = 'some message'
    receiver = 'email@example.com'
    @email_service = Kiitos::EmailService.new receiver, message
  end

  describe '#send_notification' do
    it 'should sends an email' do
      ActionMailer::Base.deliveries = []
      @email_service.send_notification
      ActionMailer::Base.deliveries.count.must_equal 1
    end
  end
end
