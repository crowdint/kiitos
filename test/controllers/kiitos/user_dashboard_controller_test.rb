require 'test_helper'

describe Kiitos::UserDashboardController do
  before do
    @routes = Kiitos::Engine.routes
  end

  describe 'GET :index' do
    it 'renders the index template' do
      User.create
      get :index
      must_render_template :index
    end
  end
end
