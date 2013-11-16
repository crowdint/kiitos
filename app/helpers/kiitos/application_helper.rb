module Kiitos
  module ApplicationHelper
    def pretty_date(date)
      date.strftime('%m/%d/%Y')
    end

    def avatar
      if kiitos_current_user.picture.present?
        image_tag kiitos_current_user.picture
      else
        gravatar_image_tag kiitos_current_user.email, gravatar: { size: 190 }
      end
    end

    def format_user_name(current_user)
      full_name = current_user.name.split ' '
      name = content_tag(:span, content_tag(:p, full_name[0]), :class => "current-user")
      name + content_tag(:span, content_tag(:p, full_name[1]), :class => "last_name") if full_name[1]
    end

    def can_send?
      Kiitos::UserQuery.allow_send_message?(kiitos_current_user) ? 'form-enabled' : 'form-disabled'
    end

    def is_admin?
      Kiitos::UserQuery.is_admin?(kiitos_current_user)
    end

    def kiitos_count count
      times = content_tag :div, class: 'times' do
        content_tag :span, "#{count}x"
      end
      times if count > 1
    end

    def is_mobile?
      request.user_agent =~ /Mobile|webOS/
    end
  end
end
