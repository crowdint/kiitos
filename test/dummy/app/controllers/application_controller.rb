class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def kiitos_current_user
    @user ||= User.first
  end

  def kiitos_user_logged?
    true
  end

end
