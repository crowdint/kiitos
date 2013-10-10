module Kiitos
  class UsersController < ApplicationController
    def index
      @users = ::Kiitos::UserQuery.all_except_user kiitos_current_user
      render json: @users
    end
  end
end
