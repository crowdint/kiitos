require 'test_helper'

describe Kiitos::Admin::AdministratorsController  do
  before do
    @routes = Kiitos::Engine.routes
  end

  describe 'POST :create' do
    before do
      @user = User.create name: 'User Name', email: 'test@example.com'
      @user2 = User.create name: 'User2 Name', email: 'test2@example.com'
    end

    it 'turns a user into an admin' do
      Kiitos::Administrator.all.count.must_equal 0
      post :create, name: @user.name
      Kiitos::Administrator.last.user_id.must_equal @user.id
    end

    it 'redirects to the users management panel' do
      post :create, name: 'User2 Name'
      response.must_redirect_to user_dashboard_path
    end
  end

  describe 'DELETE :destroy' do

    let(:user) { User.create name: 'User Name', email: 'test@example.com' }

    before do
      Kiitos::Administrator.create user_id: user.id
    end

    it 'turns an admin to a normal user' do
      Kiitos::Administrator.all.count.must_equal 1
      delete :destroy, id: user.id
      Kiitos::Administrator.all.count.must_equal 0
    end

    it 'redirects to the users management panel' do
      delete :destroy, id: user.id
      response.must_redirect_to user_dashboard_path
    end
  end
end
