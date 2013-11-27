module Kiitos
	class MessageDecorator
		include Kiitos::ApplicationHelper

		attr_reader :message_object, :current_user

		def initialize message, kiitos_current_user
			@message_object = message
			@current_user = kiitos_current_user
		end

		def color_class
			user_is_owner?(current_user) ? 'owner-color' : ''
		end

		def creation_date
			if message_object.created_at.to_date == Date.today
				'Today'
			else
				pretty_date(message_object.created_at)
			end
		end

		def user_is_owner? user
			message_object.from == user.id
		end

		# It shouldn't be neccesary to update these two methods bellow
		# as it's specifically for the decorator

		def method_missing(method_name, *args, &block)
			message_object.send method_name, *args, &block
		end

		def respond_to_missing?(method_name, include_private = false)
			message_object.respond_to?(method_name, include_private) || super
		end
	end
end