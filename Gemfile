source 'https://rubygems.org'

ruby '2.3.0'
gem 'rails',                        '~> 4.1', '>= 4.1.14.1'
gem 'puma',                         '~> 2.16.0' #Webserver to replace WEBrick
gem 'simple_form',                  '~> 3.0.1'
gem 'jquery-rails',                 '~> 3.0.4'
gem 'newrelic_rpm',                 '~> 3.6.5.130'
gem 'google-api-client',            '~> 0.6.4'
gem 'devise',                       '~> 3.2.4' # For managing authentication
gem 'figaro',                       '~> 0.7.0' # Managing environment variables
gem 'rack-timeout',                 '~> 0.3.2'
gem 'redcarpet',                    '~> 3.0.0' # to render the curriculum's .md files as html
gem 'will_paginate',                '~> 3.0.5' # to paginate student lists
gem 'protected_attributes',         '~> 1.0.5'
gem 'pg',                           '~> 0.17.1'
gem 'nokogiri',                     '1.6.2.1' #Currently locked at this version due to Premailer
gem 'github_api' # to pull in the curriculum files
gem 'omniauth-github' #for Github Authentication
gem 'premailer-rails'
gem "font-awesome-rails"
gem 'disqus' #for the forum sections of the website

group :production do
  gem 'rails_12factor',             '~> 0.0.2'
end

group :development, :test do
  gem 'factory_girl_rails',         '~> 4.3.0'
  gem 'rspec-rails',                '~> 3.4'
  gem 'database_cleaner',           '~> 1.2.0'
  gem 'fakeweb',                    '~> 1.3.0'
  gem 'capybara',                   '~> 2.6'
  gem 'capybara-webkit',            '~> 1.8'
end

group :development do
  gem 'pry'
  gem 'better_errors',              '~> 1.1.0' # gives much better error messages for debug
  gem 'quiet_assets',               '~> 1.0.2'  # shortens up the server log output
  gem 'binding_of_caller',          '~> 0.7.2' # helps out better_errors by giving you an interactive way to query variables and methods on the better_errors error screen
  gem 'letter_opener',              '~> 1.2.0' # shows outgoing emails in your browser instead
end

# update: rails 4 deprecated use of :assets group in gemfile
  gem 'sass-rails',                 '~> 4.0.1'
  gem 'coffee-rails',               '~> 4.0.1'
  gem 'twitter-bootstrap-rails',    '2.2.6'
  gem 'therubyracer',               '~> 0.12.2'
  gem 'less-rails',                 '~> 2.3.3'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby
  gem 'uglifier',                   '>= 1.0.3'
