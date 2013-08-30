require 'test_helper'

describe Kiitos::HomeController do
  describe 'GET :show' do
    context 'when successfully logged in and is the first user' do
      it 'redirects to admin panel' do
        get :show
        must_redirect_to administrator_panel_path
      end
    end

    context 'when successfully logged in and is not the first user' do
      it "redirects to the user's dashboard" do
        get :show
        must_redirect_to user_dashboard_path
      end
    end
  end
end
