module Kiitos
  module Admin
    class AdministratorsController < ApplicationController
      def create
        user = Kiitos::UserQuery.find_user params[:name]
        Administrator.create user_id: user.id
        redirect_to admin_users_path
      end

      def destroy
        if Kiitos::UserQuery.is_admin?(kiitos_current_user)
          Administrator.find(params[:id]).destroy
        end
        redirect_to admin_users_path
      end
    end
  end
end
