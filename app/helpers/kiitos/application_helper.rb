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

    def format_user_name
      "#{kiitos_current_user.name}" + content_tag(:span, "#{kiitos_current_user.last_name}", :class => "last_name")
    end

    def can_send?
      Kiitos::UserQuery.allow_send_message?(kiitos_current_user) ? 'form-enabled' : 'form-disabled'
    end

    def is_admin?
      Kiitos::UserQuery.is_admin?(kiitos_current_user)
    end
  end
end
