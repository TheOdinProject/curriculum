require 'simplecov'
SimpleCov.start 'rails'

ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../config/environment', __dir__)

abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'

Dir[Rails.root.join('spec/support/**/*.rb')].sort.each { |f| require f }
ActiveRecord::Migration[6.0].maintain_test_schema!

RSpec.configure do |config|
  config.before :each do
    DatabaseCleaner.start
  end

  config.after do
    DatabaseCleaner.clean
  end

  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.infer_base_class_for_anonymous_controllers = false
  config.filter_rails_from_backtrace!
  config.order = 'random'
end
