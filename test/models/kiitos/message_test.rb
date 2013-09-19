require 'test_helper'

describe Kiitos::Message do
  before do
    @subject = Kiitos::Message.new(
      from: 1,
      to: 2,
      kiitos_kiito_id: 1,
      message: '2 weeks ago',
      created_at: 2.weeks.ago
    )
  end

  describe 'validations' do
    it 'is valid without a to' do
      @subject.to = nil
      @subject.valid?.must_equal true
    end

    it 'is invalid without a from' do
      @subject.from = nil
      @subject.valid?.must_equal false
    end

    it 'is invalid without a kiitos_kiito_id' do
      @subject.kiitos_kiito_id = nil
      @subject.valid?.must_equal false
    end

    it 'is invalid without a message' do
      @subject.message = nil
      @subject.valid?.must_equal false
    end
  end

  describe 'after create' do
    it 'sends an email' do
      ActionMailer::Base.deliveries = []
      Kiitos::Message.create(
        from: '1@example.com',
        to: '2@example.com',
        kiitos_kiito_id: 1,
        message: '3 weeks ago',
        created_at: 3.weeks.ago
      )
      assert ActionMailer::Base.deliveries.count == 1, "Email wasn't sent"
    end
  end

  describe '.a_month_ago' do
    it 'returns messages sent up to a month ago' do
      Kiitos::Message.create(
        from: 1,
        to: '2@example.com',
        kiitos_kiito_id: 1,
        message: '3 weeks ago',
        created_at: 3.weeks.ago
      )
      Kiitos::Message.create(
        from: 1,
        to: '1@example.com',
        kiitos_kiito_id: 1,
        message: '3 months ago',
        created_at: 3.months.ago
      )
      kiitos = Kiitos::Message.a_month_ago

      kiitos.length.must_equal 1
      kiitos.first.message.must_equal '3 weeks ago'
    end
  end

  describe '.users_messages' do
    it 'returns all the users messages plus the broadcasted ones' do
      user = User.create name: 'test', email: 'test@gmail.com'
      Kiitos::Message.create(
        from: 1,
        to: user.id,
        kiitos_kiito_id: 1,
        message: '3 weeks ago',
      )
      Kiitos::Message.create(
        from: 1,
        to: 0,
        kiitos_kiito_id: 1,
        message: '3 weeks ago',
      )
      Kiitos::Message.create(
        from: user.id,
        to: 19393,
        kiitos_kiito_id: 1,
        message: '3 weeks ago',
      )
      assert Kiitos::Message.user_messages(user).count == 2, 'The messages count doesnt match'
    end
  end

  describe '#sender_email' do
    before do
      user = User.create name: 'test', email: '1@example.com'
      @message = @kiito = Kiitos::Message.create from: user.id, to: 2, kiitos_kiito_id: 1, message: '3 weeks ago', created_at: 3.weeks.ago
    end

    context 'when anonymous' do
      it 'does not return the sender email' do
        @message.anonymous = true
        @message.sender_email.must_equal 'Anonymous'
      end
    end

    context 'when not anonymous' do
      it 'returns the sender email' do
        @message.sender_email.must_equal @message.sender.email
      end
    end
  end
  
  describe '#sender_name' do
    before do
      user = User.create name: 'test', email: '1@example.com'
      @message = @kiito = Kiitos::Message.create from: user.id, to: 2, kiitos_kiito_id: 1, message: '3 weeks ago', created_at: 3.weeks.ago
    end

    context 'when anonymous' do
      it 'does not return the sender name' do
        @message.anonymous = true
        @message.sender_name.must_equal 'Anonymous'
      end
    end

    context 'when not anonymous' do
      it 'returns the sender name' do
        @message.sender_name.must_equal @message.sender.name
      end
    end
  end
end
