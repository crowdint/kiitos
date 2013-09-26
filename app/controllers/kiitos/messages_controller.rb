module Kiitos
  class MessagesController < ApplicationController
    helper_method :current_user

    def create
      @message = Message.new message_params
      @message.from = current_user.id
      if @message.save
        redirect_to user_dashboard_path
      else
        @messages = Message.user_messages(current_user).a_month_ago
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
