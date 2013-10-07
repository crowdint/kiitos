require 'test_helper'

describe Kiitos::Admin::AdministratorsController  do
  before do
    @routes = Kiitos::Engine.routes
  end

  describe 'POST :create' do
    before do
      @user = User.create name: 'User Name', email: 'test@example.com'
    end

    it 'turns a user into an admin' do
      Kiitos::Administrator.all.count.must_equal 0
      post :create, id: @user.id
      Kiitos::Administrator.last.user_id.must_equal @user.id
    end
    it 'redirects to the users management panel' do
      post :create, id: 1
      response.must_redirect_to admin_users_path
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
      response.must_redirect_to admin_users_path
    end
  end
end
