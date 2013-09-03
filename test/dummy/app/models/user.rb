class User < ActiveRecord::Base
  has_many :sent_messages, class_name: 'Kiitos::Message', foreign_key: :from
  has_many :received_messages, class_name: 'Kiitos::Message', foreign_key: :to
end
