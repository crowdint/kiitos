ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../../test/dummy/config/environment.rb",  __FILE__)
ENV["RAILS_ROOT"] ||= File.dirname(__FILE__) + "../../../test/dummy"

require 'minitest/spec'

World(MiniTest::Assertions)
MiniTest::Spec.new(nil)

require 'cucumber/rails'

ActionController::Base.allow_rescue = false

begin
  require 'database_cleaner'
  require 'database_cleaner/cucumber'

  DatabaseCleaner.strategy = :truncation
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Before do
  DatabaseCleaner.start
end

After do |scenario|
  DatabaseCleaner.clean
end

Cucumber::Rails::Database.javascript_strategy = :truncation
