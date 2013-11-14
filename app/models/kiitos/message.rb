module Kiitos
  class Message < ActiveRecord::Base
    belongs_to :kiitos_kiito, class_name: 'Kiitos::Kiito'
    belongs_to :receiver, class_name: Kiitos.user_class.to_s, foreign_key: :to
    belongs_to :sender, class_name: Kiitos.user_class.to_s, foreign_key: :from

    validates :from, :kiitos_kiito_id, :message, presence: true
    validate :one_message_per_day, on: :create

    def self.a_month_ago
      where('created_at > ?', 1.month.ago)
    end

    def sender_email
      self.anonymous ? 'Anonymous' : self.sender.email
    end

    def sender_name
      self.anonymous ? 'Anonymous' : self.sender.name
    end

    def self.group_all user_id
      joins(:kiitos_kiito).where(to: user_id).select(:kiitos_kiitos)
        .group(:kiitos_kiito).count
    end

    def self.group_by_category user_id, kiito_id
      where to: user_id, kiitos_kiito_id: kiito_id
    end

    def self.user_messages(user)
      where('kiitos_messages.to is NULL OR kiitos_messages.to = ?', user.id)
    end

    private

    def one_message_per_day
      if sender
        messages = Kiitos::UserQuery.sent_messages(sender)

        if messages.count > 0
          unless messages.last.created_at < Date.today
            errors.add(:one_kiito_per_day, I18n.t('kiitos.one_kiito_per_day'))
          end
        end
      end
    end
  end
end
