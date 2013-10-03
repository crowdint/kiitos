module Kiitos
  class HomeController < ApplicationController
    def show
      if Administrator.count > 0
        redirect_to user_dashboard_path
      else
        Administrator.create user_id: kiitos_current_user.id
        redirect_to admin_panel_path
      end
    end
  end
end
