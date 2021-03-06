require 'test_helper'

describe Kiitos::Admin::PanelController do
  before do
    @routes = Kiitos::Engine.routes
    User.create name: 'User Name', email: 'test@example.com'
  end
  describe 'GET :index' do
    it 'renders the index template' do
      get :index
      must_render_template :index
    end
  end
end
