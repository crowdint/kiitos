require 'test_helper'

describe User do

  describe '::allow_send_message?' do

    context 'when the user already sent a message today' do

      let(:current_user) { User.create name: 'Test1 Name', email: 'test1@example.com' }

      before do
        Kiitos::Message.create(
          from: current_user.id,
          to: nil,
          kiitos_kiito_id: 1,
          message: 'This is a message'
        )
      end

      it 'should returns false'do
        allow_send_message_status = current_user.allow_send_message?
        refute allow_send_message_status
      end
    end

    context 'when the user already sent a message yesterday' do

      let(:current_user) { User.create name: 'Test1 Name', email: 'test1@example.com' }

      before do
        Kiitos::Message.create(
          from: current_user.id,
          to: nil,
          kiitos_kiito_id: 1,
          message: 'This is a message',
          created_at: 1.day.ago
        )
      end

      it 'should returns true'do
        allow_send_message_status = current_user.allow_send_message?
        assert allow_send_message_status
      end
    end

    context "when the user didn't send a message" do

      let(:current_user) { User.create name: 'Test1 Name', email: 'test1@example.com' }

      it 'should return true' do
        allow_send_message_status = current_user.allow_send_message?
        assert allow_send_message_status
      end
    end

  end
end
