# Kiitos <img src="https://www.evernote.com/shard/s250/sh/863e0958-db81-4c7b-a610-e72573e34e74/b16df77e35f0806d700233e8268f1162/res/57e44c90-2a61-4009-bb9b-85d15c859dde/skitch.png?resizeSmall&width=832">

## Build status @ Travis CI:

**Branch: Master**
[![Build Status](https://magnum.travis-ci.com/crowdint/kiitos.png?token=3AuCXT2UNqnhx5etVFkm&branch=master)](https://magnum.travis-ci.com/crowdint/kiitos)

## Dependencies
This application depends on Ruby 2.0 and Ruby on Rails 4.0

## Setup a project

Add gem to project in Gemfile.

    gem 'kiitos', github: 'crowdint/kiitos'
    
To install, execute the following rake task:

    rake kiitos:install
    
After executing the command you will be required to enter information
about your app for the configuration file.

## Configuration

After installing, you can change the configuration in the file initializer that is located in:

    #config/initializers/kiitos.app
    
    # Set which user class is already implemented in the application
    Kiitos.user_class = <user_model>

    # Set the sign in path used in your application
    Kiitos.sign_in_path = '/'

## Tests

Tests are being writen using MiniTest. All tests are located at /test directory.
Fixtures are being used to provide data scenarios for tests.

To run tests execute:

    $ rake db:setup
    $ rake db:migrate RAILS_ENV=test
    $ rake

## About the Author

[Crowd Interactive](http://www.crowdint.com) is an American web design and development company that happens to work in Colima, Mexico. 
We specialize in building and growing online retail stores. We don’t work with everyone – just companies we believe in. Call us today to see if there’s a fit.

## License

Kiitos is released under the [MIT License](http://www.opensource.org/licenses/MIT).
