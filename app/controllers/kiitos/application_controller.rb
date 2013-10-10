module Kiitos
  class ApplicationController < ::ApplicationController
    before_filter :authenticate_user!
    helper_method :kiitos_current_user

    def authenticate_user!
      redirect_to Kiitos.sign_in_path unless kiitos_current_user
    end
  end
end
