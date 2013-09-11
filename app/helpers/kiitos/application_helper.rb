module Kiitos
  module ApplicationHelper
    def all_users_but_current
      ::Kiitos.user_class.all.map { |u| [u.email, u.id] unless u.email == current_user.email }.compact
    end
  end
end
