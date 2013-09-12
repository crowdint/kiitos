module Kiitos
  module ApplicationHelper
    def all_users_except_current
      ::Kiitos.user_class.all.map { |u| [u.email, u.id] unless u == current_user }.compact
    end
  end
end
