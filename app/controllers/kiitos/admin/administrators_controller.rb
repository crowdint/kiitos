module Kiitos
  module Admin
    class AdministratorsController < ApplicationController
      def create
        Administrator.create user_id: params[:id]
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
