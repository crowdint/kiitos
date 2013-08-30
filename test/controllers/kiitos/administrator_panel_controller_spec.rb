require 'minitest/spec'

describe Kiitos::AdministratorPanelController do
  describe 'GET :index' do
    it 'renders the index template' do
      must_render_template :index
    end
  end
end
