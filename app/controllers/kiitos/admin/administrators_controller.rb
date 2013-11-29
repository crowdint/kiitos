module Kiitos
  module Admin
    class AdministratorsController < ApplicationController
      def create
        user = Kiitos::UserQuery.find_user params[:name]
        admin = Administrator.new user_id: user.id
        message = if admin.save
          'The admin was added successfully.'
        else
          "The admin wasn't added successfully, please try again."
        end

        redirect_to user_dashboard_path, notice: message
      end

      def destroy
        if Kiitos::UserQuery.is_admin?(kiitos_current_user)
          Administrator.find(params[:id]).destroy
        end
        redirect_to user_dashboard_path
      end
    end
  end
end
