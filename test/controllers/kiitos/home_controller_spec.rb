require 'minitest/spec'

describe Kiitos::HomeController do
  describe 'GET :show' do
    context 'when successfully logged in and is the first user' do
      it 'redirects to admin panel' do
        get :show
        must_redirect_to administrator_panel_path
      end
    end
  end
end
