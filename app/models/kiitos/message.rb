module Kiitos
  class Message < ActiveRecord::Base
    belongs_to :kiitos_kiito, class_name: 'Kiitos::Kiito'
    belongs_to :receiver, class_name: Kiitos.user_class.to_s, foreign_key: :to
    belongs_to :sender, class_name: Kiitos.user_class.to_s, foreign_key: :from

    default_scope :default_scope

    private

    def self.default_scope
      self.where('created_at > ?', 1.month.ago)
    end
  end
end
