module Kiitos
  class MessagesController < ApplicationController
    def create
      redirect_to user_dashboard_path
    end
  end
end
