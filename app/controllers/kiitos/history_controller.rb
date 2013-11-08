module Kiitos
  class HistoryController < ApplicationController

    def index
      @messages = Message.group_all kiitos_current_user.id
    end

    def show
      @base = Kiitos::Kiito.find params[:id]
      @messages = Message.group_by_category kiitos_current_user.id, params[:id]
    end

  end
end