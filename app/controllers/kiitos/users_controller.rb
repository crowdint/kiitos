module Kiitos
  class UsersController < ApplicationController
    def index
      @users = ::Kiitos.user_class.all_except_user kiitos_current_user
      render json: @users
    end
  end
end
