require 'simplecov'

SimpleCov.start 'rails'
ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../config/environment', __dir__)

abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'

Dir[Rails.root.join('spec/support/**/*.rb')].sort.each { |f| require f }
ActiveRecord::Migration[6.0].maintain_test_schema!

RSpec.configure do |config|
  SeedFu.quiet = true

  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.infer_base_class_for_anonymous_controllers = false
  config.filter_rails_from_backtrace!
  config.order = 'random'

  config.include ViewComponent::TestHelpers, type: :component
  config.include Capybara::RSpecMatchers, type: :component
end
