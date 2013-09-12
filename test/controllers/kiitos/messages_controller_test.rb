require 'test_helper'

describe Kiitos::MessagesController do
  before do
    @routes = Kiitos::Engine.routes
    User.create name: 'test user', email: 'user1@example.com'
  end

  describe 'GET :index' do
    it 'renders the index template' do
      get :index
      must_render_template :index
    end
  end

  describe 'POST :create' do
    context 'valid params' do
      params = {
        message: {
          to: 'user1@example.com',
          kiitos_kiito_id: 1,
          message: 'Example Message'
        }
      }

      it 'redirects to users dashboard' do
        post :create, params
        must_redirect_to user_dashboard_path
      end
    end

    context 'invalid params' do
      params = { message: { to: '' } }

      it 'renders the UserDashboard index template' do
        post :create, params
        must_render_template 'kiitos/user_dashboard/index'
      end
    end
  end
end
