require 'test_helper'

describe Kiitos::ApplicationHelper do

  let(:kiitos_current_user) { User.create name: 'Test1 Name', email: 'test1@example.com' }
  let(:other_user) { User.create name: 'Test2 Name', email: 'test2@example.com' }
  let(:admin) { Kiitos::Administrator.create user_id: other_user.id }
  let(:category) { Kiitos::Category.create name: 'Test' }
  let(:kiito) { Kiitos::Kiito.create Kiitos::Kiito.create title: 'Chido', kiitos_category_id: category.id, description: 'kiito test',
        image: Rack::Test::UploadedFile.new(File.join(Rails.root, '../fixtures/images/category.png'), 'text/jpg'),
        state: 'Enabled' }

  describe :can_send? do
    context 'the user can send msg' do
      it 'should return true' do
        can_send?.must_equal 'form-enabled'
      end
    end
  end

  describe :is_admin? do
    context 'the user is an admin' do
      before do
        Kiitos::Administrator.create user_id: kiitos_current_user.id
      end

      it 'should return true' do
        is_admin?.must_equal true
      end
    end

    context 'the user is not an admin' do
      it 'should return false' do
        is_admin?.must_equal false
      end
    end
  end

  describe :kiitos_count do
    context 'more than 1' do
      it 'should return true' do
        kiitos_count(2).must_equal "<div class=\"times\"><span>2x</span></div>"
      end
    end

    context 'equal to 1' do
      it 'should return false' do
        kiitos_count(1).must_equal nil
      end
    end
  end
end