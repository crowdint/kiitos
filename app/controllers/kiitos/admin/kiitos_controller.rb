module Kiitos
  module Admin
    class KiitosController < ApplicationController
      before_filter :kiitos, only: [:create, :index]
      before_filter :find_kiito, only: [:edit, :update]
      before_filter :is_admin?

      def index
        @kiito = Kiito.new
      end

      def create
        @kiito = Kiito.new kiito_params
        if @kiito.save
          redirect_to action: :index
        else
          render :index
        end
      end

      def edit
      end

      def update
        if @kiito.update kiito_params
          redirect_to action: :edit
        else
          render :edit
        end
      end

      def destroy
        @user = Kiitos::Kiito.find(params[:id]).destroy
        render json: @user
      end

      private

      def find_kiito
        @kiito = Kiito.find(params[:id])
      end

      def kiitos
        @kiitos = Kiito.all
      end

      def kiito_params
        params.require(:kiito).permit(
          :title,
          :kiitos_category_id,
          :description,
          :image,
          :state
        )
      end

      def is_admin?
        unless Kiitos::UserQuery.is_admin?(kiitos_current_user)
          render json: { message: "Error 403, you don't have permissions for this operation" },
            status: 403
        end
      end
    end
  end
end
