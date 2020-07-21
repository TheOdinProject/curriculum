source 'https://rubygems.org'
ruby '~> 2.6'

gem 'rails',                      '6.0.3.2'

gem 'puma'
gem 'turbolinks'
gem 'jquery-rails',               '~> 4.4.0'
gem 'devise',                     '>= 4.7.1'
gem 'rack-timeout',               '~> 0.4'
gem 'kaminari',                   '~> 1.2'
gem 'pg',                         '~> 1.2'
gem 'premailer-rails',            '~> 1.11'
gem 'github_api',                 '~> 0.19'
gem 'octokit',                    '~> 4.6'
gem 'omniauth-github'
gem 'omniauth-google-oauth2'
gem 'omniauth-rails_csrf_protection'
gem 'bootstrap',                  '>= 4.4.1'
gem 'uglifier',                   '~> 4.2'
gem 'friendly_id',                '~> 5.1'
gem 'cancancan'
gem 'sass-rails',                 '~> 6.0'
gem 'rack-attack'
gem 'acts_as_votable'
gem 'kramdown'
gem 'toastr-rails'
gem 'gibbon',                     '~> 3.3.4' # for Mailchimp
gem 'nokogiri',                   '~> 1.10.10'
gem 'sprockets',                  '~> 3.7.2'
gem 'newrelic_rpm'
gem 'activeadmin'
gem 'webpacker'
gem 'react-rails'
gem 'discordrb-webhooks'

group :production do
  gem 'rails_12factor',           '~> 0.0.3'
  gem 'skylight'
end

group :development, :test, :docker do
  gem 'rspec-rails'
  gem 'simplecov', :require => false
  gem 'factory_bot_rails',                '~> 6'
  gem 'database_cleaner',                 '~> 1.8'
  gem 'webmock',                          '~> 3.8'
  gem 'vcr',                              '~> 6.0'
  gem 'shoulda-matchers'
  gem 'rake',                             '~> 13.0'
  gem 'rails-controller-testing'
  gem 'dotenv-rails'
  gem 'pry',                                '~> 0.13.1'
  gem 'factory_bot'
  gem 'climate_control'
  gem 'timecop'
end

group :development, :docker do
  gem 'web-console'
  gem 'better_errors'
  gem 'binding_of_caller',                 '~> 0.8'
  gem 'letter_opener',                     '~> 1.4'
  gem 'derailed'
  gem 'reek'
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'listen'
end
