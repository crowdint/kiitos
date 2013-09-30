module Kiitos
  class UsersController < ApplicationController
    def index
      users = ::Kiitos.user_class.all
      @users = users.map do |u|
        { value: u.name, id: u.id, name: u.name, email: u.email }
      end

      render json: @users
    end
  end
end
