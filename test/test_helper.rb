# Configure Rails Environment
ENV['RAILS_ENV'] = 'test'

require File.expand_path('../dummy/config/environment.rb',  __FILE__)
require 'rails/test_help'
require 'minitest/autorun'
require 'minitest/colorize'
require 'minitest/rails'
require 'minitest/rails/capybara'
require 'minitest/focus'
require 'database_cleaner'

Rails.backtrace_cleaner.remove_silencers!

DatabaseCleaner.clean_with :truncation
DatabaseCleaner.strategy = :truncation

module Minitest::Expectations
  infect_an_assertion :assert_redirected_to, :must_redirect_to
  infect_an_assertion :assert_template, :must_render_template
  infect_an_assertion :assert_response, :must_respond_with
end

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# Load fixtures from the engine
if ActiveSupport::TestCase.method_defined?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path('../fixtures', __FILE__)
end

class Minitest::Unit::TestCase
  class << self
    alias_method :context, :describe
  end
end
