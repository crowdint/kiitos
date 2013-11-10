require 'test_helper'

describe Kiitos::MessagesController do
  before do
    @routes = Kiitos::Engine.routes
    @current_user = User.create name: 'test user', email: 'user@example.com'
    @test_user = User.create name: 'test1 user', email: 'user1@example.com'
    @category = Kiitos::Category.create name: 'Test'
    @kiito = Kiitos::Kiito.create title: 'Chido', kiitos_category_id: @category.id, description: 'kiito test',
        image: Rack::Test::UploadedFile.new(File.join(Rails.root, '../fixtures/images/category.png'), 'text/jpg'),
        state: 'Enabled'
    @message = Kiitos::Message.create to: @current_user.id, from: @test_user.id, kiitos_kiito_id: @kiito.id,
        message: 'Msg test'
  end

  describe 'GET :index' do
    it 'renders the index template' do
      get :index
      must_render_template :index
    end
  end

  describe 'GET :show' do
    it 'renders the show template' do
      get :show, { id: @kiito.id, format: :js }
      must_render_template :show
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
