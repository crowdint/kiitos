require 'test_helper'

describe Kiitos::UsersController do
  describe 'GET :index' do
    before do
      User.create name: 'Test1 Name', email: 'test1@example.com'
      User.create name: 'Test2 Name', email: 'test2@example.com'
      User.create name: 'Test3 Name', email: 'test3@example.com'
      User.create name: 'Test4 Name', email: 'test4@example.com'
      @routes = Kiitos::Engine.routes
      get :index
    end

    it 'returns JSON of existing users except kiitos_current_user' do
      json = JSON.parse(response.body)
      json.length.must_equal 3
    end
  end
end
