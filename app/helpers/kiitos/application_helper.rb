module Kiitos
  module ApplicationHelper
    def pretty_date(date)
      date.strftime('%m/%d/%Y')
    end
  end
end
