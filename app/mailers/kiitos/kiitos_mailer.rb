module Kiitos
  class KiitosMailer < ActionMailer::Base
    default from: Kiitos.email_from

    def received_kiito_notification(to, message)
      @message = message
      mail(to: to, subject: Kiitos.email_subject)
    end
  end
end
