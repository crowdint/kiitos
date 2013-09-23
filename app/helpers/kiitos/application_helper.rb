module Kiitos
  module ApplicationHelper
    def all_users_except_current
      ::Kiitos.user_class.all.inject([['All', 'all']]) do |k, u|
        u != current_user ? k << [u.email, u.id] : k
      end
    end

    def pretty_date(date)
      date.strftime('%m/%d/%Y')
    end
  end
end
