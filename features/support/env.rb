ENV['RAILS_ENV'] = 'test'
require File.expand_path('../../../test/dummy/config/environment.rb', __FILE__)
require 'capybara'
require 'cucumber'

Capybara.default_selector = :css
