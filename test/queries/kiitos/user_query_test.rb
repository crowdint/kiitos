require 'test_helper'

describe Kiitos::UserQuery do
  before do
    DatabaseCleaner.start
  end
  after do
    DatabaseCleaner.clean
  end

  let(:current_user) { User.create name: 'Test1 Name', email: 'test1@example.com' }
  let(:other_user) { User.create name: 'Test2 Name', email: 'test2@example.com' }

  describe '::all_except_user' do

    before do
      User.create name: 'Test3 Name', email: 'test3@example.com'
      User.create name: 'Test4 Name', email: 'test4@example.com'
    end

    it 'returns all users except the user passed as a paramater' do
      users = Kiitos::UserQuery.all_except_user current_user
      users.wont_include current_user
    end
  end

  describe '::allow_send_message?' do

    context 'when the user already sent a message today' do

      before do
        Kiitos::Message.create(
          from: current_user.id,
          to: other_user.id,
          kiitos_kiito_id: 1,
          message: 'This is a message'
        )
      end

      it 'should returns false'do
        allow_send_message_status = Kiitos::UserQuery.allow_send_message? current_user
        allow_send_message_status.must_equal false
      end
    end

    context 'when the user already sent a message yesterday' do

      before do
        Kiitos::Message.create(
          from: current_user.id,
          to: other_user.id,
          kiitos_kiito_id: 1,
          message: 'This is a message',
          created_at: 1.day.ago
        )
      end

      it 'should returns true'do
        allow_send_message_status = Kiitos::UserQuery.allow_send_message? current_user
        allow_send_message_status.must_equal true
      end
    end

    context "when the user didn't send a message" do

      it 'should return true' do
        allow_send_message_status = Kiitos::UserQuery.allow_send_message? current_user
        allow_send_message_status.must_equal true
      end
    end
  end

  describe '::is_admin?' do
    before do
      Kiitos::Administrator.create user_id: current_user.id
    end

    it 'returns true when user is admin' do
      Kiitos::UserQuery.is_admin?(current_user).must_equal true
    end

    it 'returns false when user is not admin' do
      Kiitos::UserQuery.is_admin?(other_user).must_equal false
    end
  end

  describe '::find_user' do
    it 'returns the user' do
      Kiitos::UserQuery.find_user(current_user.name).must_equal current_user
    end
  end
end
