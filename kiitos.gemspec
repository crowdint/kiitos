$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'kiitos/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'kiitos'
  s.version     = Kiitos::VERSION
  s.authors     = ['Crowd Interactive']
  s.email       = ['karma@crowdint.com']
  s.homepage    = 'http://crowdint.com'
  s.summary     = 'A Rails engine to help users create, send and collect greeting cards'
  s.description = 'Crowd Interactive internal tool to allow its employees to create, send and collect greeting cards'


  s.files = Dir['{app,config,db,lib,vendor}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'carrierwave'
  s.add_dependency 'gravatar_image_tag'
  s.add_dependency 'haml-rails'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'mini_magick'
  s.add_dependency 'pg'
  s.add_dependency 'rails', '~> 4.0.0'
  s.add_dependency 'sass-rails'
  s.add_dependency 'kaminari'

  s.add_development_dependency 'capybara'
  s.add_development_dependency 'capybara_minitest_spec'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'cucumber-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'debugger'
  s.add_development_dependency 'fivemat'
  s.add_development_dependency 'gitnesse'
  s.add_development_dependency 'launchy'
  s.add_development_dependency 'minitest-colorize'
  s.add_development_dependency 'minitest-focus'
  s.add_development_dependency 'minitest-rails'
  s.add_development_dependency 'minitest-rails-capybara'
  s.add_development_dependency 'mocha'
  s.add_development_dependency 'poltergeist'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'rails_best_practices'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'selenium-webdriver', '~> 2.35.1'
end
