module Kiitos
  class MessagesController < ApplicationController

    def index
      @messages = Message.group_all kiitos_current_user.id
    end

    def show
      respond_to do |format|
        @base = Kiitos::Kiito.find params[:id]
        @messages = Message.group_by_category kiitos_current_user.id, params[:id]
        format.js
      end
    end

    def create
      @message = Message.new message_params
      @message.from = kiitos_current_user.id
      if @message.save
        Kiitos::EmailService.new(@message.to, @message.message).send_notification if @message.to
        redirect_to user_dashboard_path, notice: 'The kiito was sent successfully'
      else
        @messages = Message.user_messages(kiitos_current_user).a_month_ago
        @messages = @messages.page(params[:page])
        @messages.map! {|m| MessageDecorator.new(m, kiitos_current_user) }
        render 'kiitos/user_dashboard/index', notice: "The kiito couldn't be sent, please try again"
      end
    end

    private

    def message_params
      params.require('message').permit(:to, :kiitos_kiito_id, :message)
    end
  end
end
