require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Theodinproject
  class Application < Rails::Application
    require Rails.root.join('lib/custom_public_exceptions')
    config.exceptions_app = CustomPublicExceptions.new(Rails.public_path)
    config.middleware.insert_after ActionDispatch::Static, Rack::Deflater

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
