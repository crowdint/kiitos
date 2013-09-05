module Kiitos
  module Admin
    class KiitosController < ApplicationController

      before_filter :kiitos, only: [:create, :index]

      def index
        @kiito = Kiitos::Kiito.new
      end

      def create
        @kiito = Kiitos::Kiito.new kiito_params
        if @kiito.save
          redirect_to action: :index
        else
          render :index
        end
      end

      def edit
        @kiito = Kiitos::Kiito.find(params[:id])
      end

      def update
        @kiito = Kiitos::Kiito.find(params[:id])
        if @kiito.update kiito_params
          redirect_to action: :edit
        else
          render :edit
        end
      end

      private

      def kiitos
        @kiitos = Kiitos::Kiito.all
      end

      def kiito_params
        params.require(:kiito).permit(:title, :kiitos_category_id, :description, :image, :state)
      end
    end
  end
end
