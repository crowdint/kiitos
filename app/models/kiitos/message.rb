module Kiitos
  class Message < ActiveRecord::Base
    belongs_to :kiitos_kiito, class_name: 'Kiitos::Kiito'
    belongs_to :receiver, class_name: Kiitos.user_class.to_s, foreign_key: :to
    belongs_to :sender, class_name: Kiitos.user_class.to_s, foreign_key: :from
    after_create :send_email

    validates :from, :kiitos_kiito_id, :message, presence: true
    def self.a_month_ago
      where('created_at > ?', 1.month.ago)
    end

    def sender_email
      self.anonymous ? 'Anonymous' : self.sender.email
    end

    def self.user_messages(user)
      where("kiitos_messages.to = #{user.id} OR kiitos_messages.to = 0")
    end

    private

    def send_email
      KiitosMailer.received_kiito_notification(to, self).deliver
    end
  end
end
