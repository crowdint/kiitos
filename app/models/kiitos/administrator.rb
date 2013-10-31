module Kiitos
  class Administrator < ActiveRecord::Base
    belongs_to :user, class_name: ::Kiitos.user_class.to_s
    validates :user_id, uniqueness: true
  end
end
