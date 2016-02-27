source 'https://rubygems.org'

ruby '2.3.0'
gem 'rails',                        '~> 4.1', '>= 4.1.14.1'
gem 'sprockets-rails',              '~> 3.0', '>= 3.0.3',             :require => 'sprockets/railtie'
gem 'puma',                         '~> 2.16.0'                       #Webserver to replace WEBrick
gem 'simple_form',                  '~> 3.2.1'
gem 'jquery-rails',                 '~> 4.1.0'
gem 'newrelic_rpm',                 '~> 3.15.0.314'
gem 'google-api-client',            '~> 0.9.3'
gem 'devise',                       '~> 3.5.6'                        # For managing authentication
gem 'figaro',                       '~> 0.7.0'                        # Managing environment variables
gem 'rack-timeout',                 '~> 0.3.2'
gem 'redcarpet',                    '~> 3.3.4'                        # to render the curriculum's .md files as html
gem 'will_paginate',                '~> 3.1.0'                        # to paginate student lists
gem 'pg',                           '~> 0.18.4'
gem 'nokogiri',                     '~> 1.6.7.2'
gem 'premailer-rails',              '~> 1.9'
gem 'github_api',                   '~> 0.13.1'                       # to pull in the curriculum files
gem 'omniauth',                     '~> 1.3'
gem 'omniauth-github',              '~> 1.1.2'                        #for Github Authentication
gem 'font-awesome-rails',           '~> 4.5.0.1'
gem 'disqus',                       '~> 1.0.4'                        #for the forum sections of the website
gem 'sass-rails',                   '~> 5.0.4'
gem 'coffee-rails',                 '~> 4.1.1'
gem 'twitter-bootstrap-rails',      '~> 2.2.8'
gem 'therubyracer',                 '~> 0.12.2'                       # See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'less-rails',                   '~> 2.7.1'
gem 'uglifier',                     '>= 2.7.2'
gem 'selenium-webdriver',           '~> 2.52'

group :production do
  gem 'rails_12factor',             '~> 0.0.2'
end

group :development, :test do
  gem 'factory_girl_rails',         '~> 4.6.0'
  gem 'rspec-rails',                '~> 3.4.2'
  gem 'database_cleaner',           '~> 1.5.1'
  gem 'fakeweb',                    '~> 1.3.0'
  gem 'capybara',                   '~> 2.6.2'
  gem 'capybara-webkit',            '~> 1.8.0'
end

group :development do
  gem 'pry-byebug',                 '~> 3.3'
  gem 'web-console',                '~> 3.0'
  gem 'better_errors',              '~> 2.1.1'                        # gives much better error messages for debug
  gem 'quiet_assets',               '~> 1.1.0'                        # shortens up the server log output
  gem 'binding_of_caller',          '~> 0.7.2'                        # helps out better_errors by giving you an interactive way to query variables and methods on the better_errors error screen
  gem 'letter_opener',              '~> 1.4.1'                        # shows outgoing emails in your browser instead
end
