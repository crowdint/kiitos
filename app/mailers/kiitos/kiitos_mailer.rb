module Kiitos
  class KiitosMailer < ActionMailer::Base
    default from: 'no-reply@crowdint.com'

    def received_kiito_notification(to, message)
      @message = message
      mail(to: to, subject: 'You have received a new kiito')
    end
  end
end
