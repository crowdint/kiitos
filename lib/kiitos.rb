require 'kiitos/engine'
require 'haml'
require 'gravatar_image_tag'
require 'carrierwave'

module Kiitos
  mattr_accessor :user_class, :sign_in_path, :email_from, :email_subject

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
