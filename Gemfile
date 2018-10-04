source 'https://rubygems.org'
ruby '2.5'

gem 'rails',                        '~> 5.0.0'
gem 'puma',                         '~> 3.11.2'
gem 'turbolinks'
gem 'jquery-rails',                 '~> 4.2.1'
gem 'devise',                       '~> 4.4.0' # Managing environment variables
gem 'rack-timeout',                 '~> 0.4'
gem 'kaminari',                     '~> 1.0', '>= 1.0.1'
gem 'pg',                           '~> 0.19'
gem 'premailer-rails',              '~> 1.9'
gem 'github_api',                   '~> 0.14' # to pull in the curriculum files
gem 'octokit',                      '~> 4.6'
gem 'omniauth-github',              '~> 1.1.2' #for Github Authentication
gem 'omniauth-google-oauth2',       '~> 0.5.1' #for Google Authentication
gem 'font-awesome-rails',           '~> 4.7'
gem 'bootstrap',                    '~> 4.1.2'
gem 'uglifier',                    '~> 3.0'
gem 'friendly_id',                  '~> 5.1'
gem 'cancancan',                    '~> 1.15'
gem 'sass-rails',                   '~> 5.0'
gem 'rack-attack'
gem 'acts_as_votable'
gem 'kramdown'
gem 'toastr-rails'
gem 'gibbon',                       '~> 3.2.0' # for Mailchimp
gem 'nokogiri',                     '~> 1.8', '>= 1.8.4'
gem 'sprockets',                    '~> 3.7.2'
gem 'skylight'

group :production do
  gem 'rails_12factor',             '~> 0.0.3'
  gem 'newrelic_rpm',               '~> 3.17'
end

group :development, :test do
  gem 'rspec-rails',                       '~> 3.5'
  gem 'cucumber-rails',require: false
  gem 'simplecov', :require => false
  gem 'factory_bot_rails',                '~> 4.11'
  gem 'capybara',                          '~> 2.10'
  gem 'phantomjs',                         '~> 2.1'
  gem 'poltergeist',                       '~> 1.1'
  gem 'capybara-email',                    '~> 2.5'
  gem 'database_cleaner',                  '~> 1.5'
  gem 'webmock',                           '~> 2.1'
  gem 'vcr',                               '~> 3.0'
  gem 'shoulda-matchers',                  '~> 3.1'
  gem 'rake',                              '~> 11.3'
  gem 'rails-controller-testing',          '~> 1.0'
  gem 'figaro',                            '1.1'
  gem 'bundle-audit'
end

group :development do
  gem 'web-console',                       '~> 3.4'
  gem 'better_errors',                     '~> 2.4'  # gives much better error messages for debug
  gem 'binding_of_caller',                 '~> 0.8'  # helps out better_errors by giving you an interactive way to query variables and methods on the better_errors error screen
  gem 'letter_opener',                     '~> 1.4'  # shows outgoing emails in your browser instead
  gem 'derailed'                                     # Memory benchmarking
  gem 'reek'                                         # Code smell detector
  gem 'rubocop', require: false                      # Static code analyser
end
