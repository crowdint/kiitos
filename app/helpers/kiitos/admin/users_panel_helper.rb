module Kiitos
  module Admin
    module UsersPanelHelper
      def is_admin?(user)
        Administrator.all.any? do |a|
          a.user_id == user.id
        end
      end

    end
  end
end
