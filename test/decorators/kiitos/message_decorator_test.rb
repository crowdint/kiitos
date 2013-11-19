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
    @subject = Kiitos::MessageDecorator.new message, @user
  end

  describe '#color_class' do
  	context 'when the user owns the message' do
  		it 'returns the message owner color' do
  			@subject.color_class.must_equal 'owner-color'
  		end
  	end

  	context 'when the user does not own the message' do
  		it 'returns blank' do
  			@subject.stubs(:user_is_owner?).returns false

  			@subject.color_class.must_equal ''
  		end
  	end
  end

  describe '#creation_date' do
  	context 'when the message was created today' do
  		it 'returns Today text' do
  			@subject.creation_date.must_equal 'Today'
  		end
  	end

  	context 'when the message was not created today' do
  		it 'returns a formatted date' do
  			dummy_time = Time.zone.parse('2007-02-10 15:30:45')
  			Kiitos::Message.any_instance.stubs(:created_at).returns dummy_time

  			@subject.creation_date.must_equal '02/10/2007'
  		end
  	end
  end

  describe '#user_is_owner?' do
  	context 'when the user is owner' do
  		it 'returns true' do
  			@subject.user_is_owner?(@user).must_equal true
  		end

  		it 'returns false' do
  			Kiitos::Message.any_instance.stubs(:from).returns 0

  			@subject.user_is_owner?(@user).must_equal false
  		end
  	end
  end
end