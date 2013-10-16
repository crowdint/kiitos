module Kiitos
  class EmailService
    def initialize(receiver, message)
      @receiver = receiver
      @message = message
    end

    def send_notification
      KiitosMailer.received_kiito_notification(@receiver, @message).deliver
    end
  end
end
