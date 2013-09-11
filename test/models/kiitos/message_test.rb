require 'test_helper'

describe Kiitos::Message do
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
        from: '1@example.com',
        to: '2@example.com',
        kiitos_kiito_id: 1,
        message: '3 weeks ago',
        created_at: 3.weeks.ago
      )
      Kiitos::Message.create(
        from: '2@example.com',
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
end
