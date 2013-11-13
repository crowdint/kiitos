module Kiitos
  class UserDashboardController < ApplicationController
    def index
      get_administrators
      @kiitos = Kiitos::Kiito.all

      if params[:search_span]
        @messages = Message.user_messages(kiitos_current_user)
      else
        @messages = Message.user_messages(kiitos_current_user).a_month_ago
      end

      @messages.map! {|m| MessageDecorator.new(m, kiitos_current_user) }

      @message = Message.new
    end

    private

    def get_administrators
      if Kiitos::UserQuery.is_admin?(kiitos_current_user)
        @administrators ||= Kiitos::Administrator.all
      end
    end
  end
end
