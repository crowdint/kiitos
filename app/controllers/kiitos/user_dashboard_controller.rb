module Kiitos
  class UserDashboardController < ApplicationController
    def index
      @messages = current_user.received_messages
    end
  end
end
