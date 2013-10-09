module Models::UserDependencies
  Kiitos.user_class.class_eval do
    has_many :sent_messages, class_name: 'Kiitos::Message', foreign_key: :from
    has_many :received_messages, class_name: 'Kiitos::Message', foreign_key: :to

    def self.all_except_user(user)
      where('email <> ?', user.email)
    end
  end
end
