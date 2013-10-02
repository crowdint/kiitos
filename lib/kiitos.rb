require 'kiitos/engine'
require 'haml'

module Kiitos
  mattr_accessor :user_class, :avatar_method, :sign_in_path

  class << self
    def user_class
      if @@user_class.is_a?(Class)
        raise StandardError.new 'Kiitos user_class must be defined as string'

      elsif @@user_class.is_a?(String)
        begin
          Object.const_get(@@user_class)
        rescue NameError
          @@user_class.constantize
        end
      end
    end
  end
end
