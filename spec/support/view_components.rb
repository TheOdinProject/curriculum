require 'view_component/test_helpers'
require 'capybara/rspec'

RSpec.configure do |config|
  config.include ViewComponent::TestHelpers, type: :component
  config.include Capybara::RSpecMatchers, type: :component
  config.include Devise::Test::ControllerHelpers, type: :component

  config.before(:each, type: :component) do
    @request = controller.request
  end
end
