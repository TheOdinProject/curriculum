# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
DEFAULT_HOST = "localhost"
DEFAULT_PORT = 3001 

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
  Capybara.javascript_driver = :webkit
  Capybara.always_include_port = true
  Capybara.default_host = "http://#{DEFAULT_HOST}"
  Capybara.server_port = DEFAULT_PORT
  Capybara.app_host = "http://#{DEFAULT_HOST}:#{Capybara.server_port}"
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

  config.use_transactional_fixtures = true

  config.infer_base_class_for_anonymous_controllers = false

  config.order = "random"
end
