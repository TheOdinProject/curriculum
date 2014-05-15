

# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
DEFAULT_HOST = "localhost"

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

def wait_for_ajax
  Timeout.timeout(Capybara.default_wait_time) do
    loop do
      active = page.evaluate_script('jQuery.active')
      break if active == 0
    end
  end
end

RSpec.configure do |config|
  config.include Capybara::DSL
  Capybara.javascript_driver = :webkit_debug
  Capybara.always_include_port = true
  Capybara.default_host = "http://#{DEFAULT_HOST}"
  #fixes issues with capybara not detecting db changes made during tests
  config.use_transactional_fixtures = false


  config.before :each do
    if Capybara.current_driver == :rack_test
      DatabaseCleaner.strategy = :transaction
    else
      DatabaseCleaner.strategy = :truncation
    end
    DatabaseCleaner.start
  end

  config.after do
    DatabaseCleaner.clean
  end

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  # NOTE: Changed this from `true` to `false` so that selenium
  # tests which rely on javascript can actually access the database
  # operations, which otherwise would occur in a separate thread
  # as a transaction (to be rolled back after each test and not persisted).  This is slower but allows those specs to actually run.
  # See http://stackoverflow.com/questions/5433690/capybaraselemium-how-to-initialize-database-in-an-integration-test-code-and-ma
  config.use_transactional_fixtures = false

  config.infer_base_class_for_anonymous_controllers = false

  config.order = "random"

  OmniAuth.config.test_mode = true


end
