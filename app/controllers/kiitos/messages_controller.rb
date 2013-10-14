module Kiitos
  class MessagesController < ApplicationController
    def create
      @message = Message.new message_params
      @message.from = kiitos_current_user.id
      if @message.save
        email_service = Kiitos::EmailService.new @message.to, @message.message if @message.to
        email_service && email_service.send_notification
        redirect_to user_dashboard_path
      else
        @messages = Message.user_messages(kiitos_current_user).a_month_ago
        render 'kiitos/user_dashboard/index'
      end
    end

    def index
      @messages = Message.a_month_ago
    end

    private

    def message_params
      params.require('message').permit(:to, :kiitos_kiito_id, :message, :anonymous)
    end
  end
end
