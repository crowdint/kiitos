module Kiitos
	class MessageDecorator
		include Kiitos::ApplicationHelper

		attr_reader :message_object

		def initialize message
			@message_object = message
		end

		def color_class user
			user_is_owner?(user) ? 'owner-color' : ''
		end

		def creation_date
			if message_object.created_at.to_date == Date.today
				'Today'
			else
				pretty_date(message_object.created_at)
			end
		end

		def sender_name user
			name = user_is_owner?(user) ? 'Me' : message_object.sender.name
      message_object.anonymous ? 'Anonymous' : name
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