module Kiitos
  class KiitosMailer < ActionMailer::Base
    default from: 'noreply@kiitos.crowdint.com'

    def received_kiito_notification(to, message)
      @message = message
      mail to: to, subject: 'You have received a Kiito'
    end
  end
end
