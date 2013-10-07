source 'https://rubygems.org'

ruby '1.9.3'
gem 'rails',              '3.2.12'
gem 'pg',                 '~> 0.15.1'
gem 'simple_form',        '~> 2.1.0'
gem 'jquery-rails',       '~> 3.0.4'
gem 'jquery-ui-rails',    '~> 4.0.3'
gem 'newrelic_rpm',       '~> 3.6.5.130'
gem 'google-api-client',  '~> 0.6.4'
gem 'devise',             '~> 2.2.4' # For managing authentication
gem 'figaro'                         # Managing environment variables
gem 'github_api'  # to pull in the curriculum files
gem 'thin'  # to use the "thin" webserver instead of webrick

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :production do
end

group :development, :test do
  gem 'factory_girl_rails'
end

group :development do
  gem 'better_errors' # gives much better error messages for debug
  gem 'quiet_assets'  # shortens up the server log output
  gem 'binding_of_caller' # helps out better_errors by giving you an interactive way to query variables and methods on the better_errors error screen
  gem 'letter_opener' # shows outgoing emails in your browser instead
  gem 'rspec-rails'
  gem 'capybara',                   '<= 2.0.2'
  gem 'localtunnel'
end

group :test do
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',                 '~> 3.2.3'
  gem 'coffee-rails',               '~> 3.2.1'
  gem 'twitter-bootstrap-rails',    '2.2.6'
  gem 'therubyracer',               '~> 0.11.4'
  gem 'less-rails',                 '~> 2.3.3'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier',                   '>= 1.0.3'
end


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
