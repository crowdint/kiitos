ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../../test/dummy/config/environment.rb',  __FILE__)
ENV['RAILS_ROOT'] ||= File.dirname(__FILE__) + '../../../test/dummy'

require 'debugger'
require 'minitest/spec'
require 'capybara/poltergeist'
require 'coffee_script'

Capybara.javascript_driver = :poltergeist

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, js_errors: false)
end

World(MiniTest::Assertions)
MiniTest::Spec.new(nil)

require 'cucumber/rails'

ActionController::Base.allow_rescue = false

begin
  require 'database_cleaner'
  require 'database_cleaner/cucumber'

  DatabaseCleaner.strategy = :truncation
  DatabaseCleaner.clean
rescue NameError
  raise 'You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it.'
end

Before do
  DatabaseCleaner.start
end

at_exit do
  FileUtils.rm_rf(Dir[Rails.root + 'public/uploads'])
end

Cucumber::Rails::Database.javascript_strategy = :truncation

Minitest::Unit::TestCase.class_eval do
  def wait_for_ajax
    counter = 0
    while page.evaluate_script("$.active").to_i > 0
      counter += 1
      sleep(0.1)
      raise "AJAX request took longer than 5 seconds." if counter >= 50
    end
  end
end
