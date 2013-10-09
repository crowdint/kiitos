module Models::UserDependencies
  Kiitos.user_class.class_eval do
    has_many :sent_messages, class_name: 'Kiitos::Message', foreign_key: :from
    has_many :received_messages, class_name: 'Kiitos::Message', foreign_key: :to

    def allow_send_message?
      if sent_messages.empty?
        true
      else
        sent_messages.last.created_at < Date.today
      end
    end
  end
end
