module Kiitos
  class Administrator < ActiveRecord::Base
    belongs_to :user, class_name: Kiitos.user_class.to_s
  end
end
