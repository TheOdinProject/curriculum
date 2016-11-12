source 'https://rubygems.org'
ruby '2.3.0'

gem 'rails',                        '~> 5.0.0'
gem 'puma'
gem 'simple_form'
gem 'jquery-rails'
gem 'google-api-client'
gem 'devise',                       '~> 4.2.0'                        # For managing authentication
gem 'figaro'                       # Managing environment variables
gem 'rack-timeout'
gem 'redcarpet'                       # to render the curriculum's .md files as html
gem 'will_paginate'                        # to paginate student lists
gem 'pg'
gem 'nokogiri'
gem 'premailer-rails'
gem 'github_api'                     # to pull in the curriculum files
gem 'octokit'
gem 'omniauth-github'                      #for Github Authentication
gem 'font-awesome-rails'
gem 'sass-rails'
gem 'coffee-rails'
gem 'twitter-bootstrap-rails',      '~> 2.2.8'
gem 'therubyracer'                      # See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'less-rails'
gem 'uglifier'
gem 'shortener'
gem 'friendly_id'
gem 'cancancan'

group :production do
  gem 'rails_12factor'
  gem 'newrelic_rpm'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'cucumber-rails', require: false
  gem 'simplecov', :require => false                                # Code coverage
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'phantomjs'
  gem 'poltergeist'
  gem 'capybara-email'
  gem 'database_cleaner'
  gem 'webmock'
  gem 'vcr'
  gem 'shoulda-matchers'
  gem 'rake'
  gem 'rails-controller-testing'
end

group :development do
  gem 'web-console'
  gem 'better_errors'                       # gives much better error messages for debug                   # shortens up the server log output
  gem 'binding_of_caller'                      # helps out better_errors by giving you an interactive way to query variables and methods on the better_errors error screen
  gem 'letter_opener'                       # shows outgoing emails in your browser instead
  gem 'derailed'                                                      # Memory benchmarking
  gem 'reek'                                                          # Code smell detector
  gem 'rubocop', require: false                                       # Static code analyser
end
