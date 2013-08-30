module Kiitos
  class HomeController < ApplicationController
    def show
      if Kiitos::Administrator.count > 0
        redirect_to user_dashboard_path
      else
        Kiitos::Administrator.create user_id: 1
        redirect_to administrator_panel_path
      end
    end

  end
end
