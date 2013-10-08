require 'test_helper'

describe User do

  describe '::all_except_user' do

    let(:current_user) { User.create name: 'Test1 Name', email: 'test1@example.com' }

    before do
      User.create name: 'Test2 Name', email: 'test2@example.com'
      User.create name: 'Test3 Name', email: 'test3@example.com'
      User.create name: 'Test4 Name', email: 'test4@example.com'
    end

    it 'returns all users except the user passed as a paramater' do
      users = User.all_except_user current_user
      refute_includes users, current_user
    end
  end
end
