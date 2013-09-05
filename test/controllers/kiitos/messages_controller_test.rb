require 'test_helper'

describe Kiitos::MessagesController do
  
  before do
    @routes = Kiitos::Engine.routes
  end

  describe ':create' do
    it 'redirects to users dashboard' do
      post :create
      must_redirect_to user_dashboard_path
    end
  end
end
