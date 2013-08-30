require 'test_helper'

describe Kiitos::HomeController do
  before do
    @routes = Kiitos::Engine.routes
  end

  describe 'GET :show' do
    context 'when successfully logged in and is the first user' do
      it 'redirects to admin panel' do
        get :show
        must_redirect_to administrator_panel_path
      end
    end

    context 'when successfully logged in and is not the first user' do
      it "redirects to the user's dashboard" do
        Kiitos::Administrator.create user_id: 1
        get :show
        must_redirect_to user_dashboard_path
      end
    end
  end
end
