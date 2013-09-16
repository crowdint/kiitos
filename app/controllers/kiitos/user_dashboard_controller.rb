module Kiitos
  class UserDashboardController < ApplicationController
    helper_method :current_user

    def index
      if params[:search_span]
        @messages = Message.user_messages(current_user)
      else
        @messages = Message.user_messages(current_user).a_month_ago
      end
      @message = Message.new
    end
  end
end
