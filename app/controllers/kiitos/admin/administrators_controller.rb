module Kiitos
  module Admin
    class AdministratorsController < ApplicationController
      def create
        Kiitos::Administrator.create user_id: params[:user_id]
        redirect_to admin_users_path
      end

      def destroy
        Kiitos::Administrator.where(user_id: params[:id]).first.destroy
        redirect_to admin_users_path
      end
    end
  end
end
