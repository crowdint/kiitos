require 'rails/generators'

module Kiitos
  module Generators
    # This generator setups the user_class, current_user, migrations
    # and mounts the engine on the application where will be used.
    class InstallGenerator < Rails::Generators::Base
      class_option 'user-class', type: :string
      class_option 'current-user-helper', type: :string
      class_option 'user-logged-helper', type: :string
      class_option 'no-migrate', type: :boolean

      source_root File.expand_path('../templates', __FILE__)
      desc 'Used to install Kiitos'

      def title_engine
        puts translate :title
      end

      def install_migrations
        unless options['no-migrate']
          puts translate :copying_migrations
          Dir.chdir(Rails.root) do
            `rake kiitos:install:migrations`
          end
        end
      end

      def determine_user_class
        @user_class = options['user-class'].presence ||
          ask(translate :user_name_class).presence || 'User'
      end

      def determine_current_user_helper
        puts translate :defining_kiitos

        text = "\talias_method :kiitos_current_user, :current_identity\n\n"

        inject_into_file(
          "#{Rails.root}/app/controllers/application_controller.rb", text,
          before: "protected")
      end

      def add_kiitos_initializer
        path = "#{Rails.root}/config/initializers/kiitos.rb"

        if File.exists? path
          puts translate :skipping_initializer
        else
          puts translate :adding_initializer
          template 'kiitos_initializer.rb', path
        end
      end

      def run_migrations
        unless options['no-migrate']
          puts translate :running_migrations
          `rake db:migrate`
        end
      end

      def mount_engine
        puts translate :mounting_kiitos

        template = File.expand_path('../templates', __FILE__)
        resource = File.read(template + '/routes.rb')

        insert_into_file("#{Rails.root}/config/routes.rb", resource,
          after: /routes.draw.do\n/)
      end

      def finished
        output = "\n\n" + ('*' * 53)
        output += translate :review
        output += step(translate :step1)
        output += step(translate :step2)
        output += step(translate :step3)

        unless options['no-migrate']
          output += step(translate :step4)
          output += step(translate :step5)
        end

        output += step(translate :step6)
        output += step(translate :step7)
        output += translate :thanks

        puts output
      end

      private

      def translate(message)
        I18n.t message, scope: [:kiitos, :installer, :messages]
      end

      def step(words)
        @step ||= 0
        @step += 1
        "#{@step}) #{words}\n"
      end

      def user_class
        @user_class
      end
    end
  end
end
