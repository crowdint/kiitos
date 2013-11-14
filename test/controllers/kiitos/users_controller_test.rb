require 'test_helper'

describe Kiitos::UsersController do
  before do
    @routes = Kiitos::Engine.routes
  end

  describe 'GET :index' do
    before do
      User.create name: 'Test1 Name', email: 'test1@example.com'
      User.create name: 'Test2 Name', email: 'test2@example.com'
      User.create name: 'Test3 Name', email: 'test3@example.com'
    end

    it 'returns JSON of existing users except kiitos_current_user' do
      get :index
      json = JSON.parse(response.body)
      json.wont_include "{ id: 1, name: 'Test1 Name', email: 'test1@example.com' }"
      json.length.must_equal 2
    end
  end
end
