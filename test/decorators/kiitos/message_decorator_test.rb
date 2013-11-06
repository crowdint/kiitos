require 'test_helper'

describe Kiitos::MessageDecorator do
  before do
    @user = User.create name: 'Test User', email: 'test@example.com'
    message = Kiitos::Message.new(
    	from: @user.id,
      to: 2,
      kiitos_kiito_id: 1,
      message: '2 weeks ago',
      created_at: DateTime.now
    )
    @subject = Kiitos::MessageDecorator.new message
  end

  describe '#color_class' do
  	context 'when the user owns the message' do
  		it 'should return the message owner color' do
  			@subject.color_class(@user).must_equal 'owner-color'
  		end
  	end

  	context 'when the user does not own the message' do
  		it 'should return blank' do
  			@subject.stubs(:user_is_owner?).returns false

  			@subject.color_class(@user).must_equal ''
  		end
  	end
  end

  describe '#creation_date' do
  	context 'when the message was created today' do
  		it 'should return Today text' do
  			@subject.creation_date.must_equal 'Today'
  		end
  	end

  	context 'when the message was not created today' do
  		it 'should return a formatted date' do
  			dummy_time = Time.zone.parse('2007-02-10 15:30:45')
  			Kiitos::Message.any_instance.stubs(:created_at).returns dummy_time

  			@subject.creation_date.must_equal '02/10/2007'
  		end
  	end
  end

  describe '#sender_name' do
  	context 'when the sender is anonymous' do
  		it 'should return Anonymous text' do
  			Kiitos::Message.any_instance.stubs(:anonymous).returns true

  			@subject.sender_name(@user).must_equal 'Anonymous'
  		end
  	end

  	context 'when the sender is the current user' do
  		it 'should return Me text' do
  			@subject.sender_name(@user).must_equal 'Me'
  		end
  	end

  	context 'when the sender is another known user' do
  		it 'should return the name of the sender' do
  			@subject.stubs(:user_is_owner?).returns false
  			User.any_instance.stubs(:name).returns 'José Perez León'

  			@subject.sender_name(@user).must_equal 'José Perez León'
  		end
  	end
  end

  describe '#user_is_owner?' do
  	context 'when the user is owner' do
  		it 'should return true' do
  			@subject.user_is_owner?(@user).must_equal true
  		end

  		it 'should return false' do
  			Kiitos::Message.any_instance.stubs(:from).returns 0

  			@subject.user_is_owner?(@user).must_equal false
  		end
  	end
  end
end