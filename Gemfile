source 'https://rubygems.org'

ruby '2.0.0'
gem 'rails',              '4.0.2'
gem 'simple_form',         '~> 3.0.1'
gem 'jquery-rails',       '~> 3.0.4'
gem 'newrelic_rpm',       '~> 3.6.5.130'
gem 'google-api-client',  '~> 0.6.4'
gem 'devise',    '~> 3.2.4'          # For managing authentication
gem 'figaro',     '~> 0.7.0'                    # Managing environment variables
gem 'github_api', '~> 0.11.1' # to pull in the curriculum files
gem 'thin', '~> 1.6.1' # to use the "thin" webserver instead of webrick
gem 'redcarpet', '~> 3.0.0' # to render the curriculum's .md files as html
gem 'will_paginate', '~> 3.0.5' # to paginate student lists
gem 'protected_attributes', '~> 1.0.5'
gem 'pg', '~> 0.17.1'
gem 'premailer-rails'
gem 'omniauth-github' #for Github Authentication
gem "font-awesome-rails"
gem 'disqus' #for the forum sections of the website


# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :production do
  gem 'rails_12factor', '~> 0.0.2'
end

group :development, :test do
  gem 'factory_girl_rails', '~> 4.3.0'
  gem 'rspec-rails', '~> 2.14.1'
  gem 'database_cleaner', '~> 1.2.0'
  gem 'fakeweb', '~> 1.3.0'
  gem 'capybara',                   '<= 2.0.2'
  gem 'capybara-webkit', '~> 1.1.1'
end

group :development do
  gem 'pry'
  gem 'better_errors', '~> 1.1.0' # gives much better error messages for debug
  gem 'quiet_assets', '~> 1.0.2'  # shortens up the server log output
  gem 'binding_of_caller', '~> 0.7.2' # helps out better_errors by giving you an interactive way to query variables and methods on the better_errors error screen
  gem 'letter_opener', '~> 1.2.0' # shows outgoing emails in your browser instead
end

# update: rails 4 deprecated use of :assets group in gemfile
  gem 'sass-rails', '~> 4.0.1'
  gem 'coffee-rails', '~> 4.0.1'
  gem 'twitter-bootstrap-rails',    '2.2.6'
  gem 'therubyracer'
  gem 'less-rails',                 '~> 2.3.3'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier',                   '>= 1.0.3'


# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
