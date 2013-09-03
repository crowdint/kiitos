require 'test_helper'

describe Kiitos::Message do

  describe 'default scope' do
    it 'returns messages sent up to a month ago' do
      Kiitos::Message.create message: '3 weeks ago', created_at: 3.weeks.ago
      Kiitos::Message.create message: '3 months ago', created_at: 3.months.ago
      kiitos = Kiitos::Message.all

      kiitos.length.must_equal 1
      kiitos.first.message.must_equal '3 weeks ago'
    end
  end
end
