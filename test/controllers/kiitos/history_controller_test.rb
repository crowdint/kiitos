require 'test_helper'

describe Kiitos::HistoryController do
  before do
    @routes = Kiitos::Engine.routes
    @current_user = User.create name: 'test user', email: 'user1@example.com'
    @test_user = User.create name: 'test user2', email: 'user2@example.com'
    @category = Kiitos::Category.create name: 'Test'
    @kiito = Kiitos::Kiito.create title: 'Chido', kiitos_category_id: @category.id, description: 'kiito test',
            image: Rack::Test::UploadedFile.new(File.join(Rails.root, '../fixtures/images/category.png'), 'text/jpg'),
            state: 'Enabled'
    @message = Kiitos::Message.create to: @current_user.id, from: @test_user.id, kiitos_kiito_id: @kiito.id, message: 'Chido one!'
  end

  describe 'GET :index' do
    it 'returns the kiito and the count' do
      get :index
      must_render_template :index
    end
  end

end
