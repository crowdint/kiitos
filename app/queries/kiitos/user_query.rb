module Kiitos
  class UserQuery
    def self.allow_send_message?(user)
      if sent_messages(user).empty?
        true
      else
        sent_messages(user).last.created_at < Date.today
      end
    end

    def self.all_except_user(user)
      Kiitos.user_class.where('email <> ?', user.email)
    end

    def self.sent_messages(user)
      Kiitos::Message.where(from:  user.id)
    end

    def self.received_messages(user)
      Kiitos::Message.where(to:  user.id)
    end

    def self.is_admin?(user)
      Kiitos::Administrator.exists?(user_id:  user.id) ? true : false
    end

    def self.find_user(name)
      Kiitos.user_class.find_by name: name
    end

    def self.find_user_by_id(id)
      Kiitos.user_class.find id
    end

  end
end
