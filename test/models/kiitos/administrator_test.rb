require 'test_helper'

describe Kiitos::Administrator do
	before do
		@user = User.create name: 'Test User', email: 'test@example.com'
		@admin = Kiitos::Administrator.create user_id: @user.id
	end

	describe 'validations' do
		it 'is invalid if the user is already taken' do
			@admin2 = Kiitos::Administrator.create user_id: @user.id

			@admin2.errors.any?.must_equal true
			@admin2.errors.full_messages.include?('User has already been taken').must_equal true
		end
	end
end