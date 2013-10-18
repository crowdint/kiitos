require 'test_helper'

describe Kiitos::HomeController do
  before do
    @routes = Kiitos::Engine.routes
    User.create name: 'test', email: 'test@example.com'
  end

  describe 'GET :show' do
    it 'redirects to user dashboard' do
      get :show
      must_redirect_to user_dashboard_path
    end

    context 'when successfully logged in and is the first user' do
      it 'creates an admin' do
        before = Kiitos::Administrator.count
        get :show
        (Kiitos::Administrator.count - before).must_equal 1
      end
    end

    context 'when successfully logged in and is not the first user' do
      it 'does not create an admin' do
        Kiitos::Administrator.create user_id: 1
        before = Kiitos::Administrator.count
        get :show
        (Kiitos::Administrator.count - before).must_equal 0
      end
    end
  end
end
