module Kiitos
  class HomeController < ApplicationController
    def show
      Kiitos::Administrator.create user_id: 1
      redirect_to administrator_panel_path
    end

  end
end
