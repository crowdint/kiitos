module Kiitos
  class UserDashboardController < ApplicationController
    def index
      if params[:search_span]
        @messages = current_user.received_messages
      else
        @messages = current_user.received_messages.a_month_ago
      end
      @message = Message.new
    end
  end
end
