module Kiitos
  module Admin
    class UsersPanelController < ApplicationController

      helper_method :users, :is_admin?

      def index
      end

      private

      def users
        Kiitos.user_class.all
      end

      def is_admin?(user)
        Kiitos::Administrator.all.any? do |a|
          a.user_id == user.id
        end
      end
    end
  end
end

