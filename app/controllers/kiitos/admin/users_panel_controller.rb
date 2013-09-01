module Kiitos
  module Admin
    class UsersPanelController < ApplicationController

      helper_method :users

      def index
      end

      private

      def users
        User.all
      end
    end
  end
end

