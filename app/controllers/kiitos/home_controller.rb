module Kiitos
  class HomeController < ApplicationController
    def show
      unless Administrator.count > 0
        Administrator.create user_id: kiitos_current_user.id
      end

      redirect_to user_dashboard_path
    end
  end
end
