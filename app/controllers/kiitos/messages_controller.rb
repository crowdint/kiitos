module Kiitos
  class MessagesController < ApplicationController

    def create
      @message = Message.new message_params
      @message.from = current_user.id
      if @message.save
        redirect_to user_dashboard_path
      else
        @messages = current_user.received_messages
        render 'kiitos/user_dashboard/index'
      end
    end

    def index
      @messages = Message.a_month_ago
    end

    private

    def message_params
      params.require('message').permit(:to, :kiitos_kiito_id, :message)
    end
  end
end
