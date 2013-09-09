module Kiitos
  class Message < ActiveRecord::Base
    belongs_to :kiitos_kiito, class_name: 'Kiitos::Kiito'
    belongs_to :receiver, class_name: Kiitos.user_class.to_s, foreign_key: :to
    belongs_to :sender, class_name: Kiitos.user_class.to_s, foreign_key: :from
    after_create :send_email

    validates :to, :from, :kiitos_kiito_id, :message, presence: true
    def self.a_month_ago
      self.where('created_at > ?', 1.month.ago)
    end

    private
    def send_email
      KiitosMailer.received_kiito_notification(self.to, self).deliver
    end
  end
end
