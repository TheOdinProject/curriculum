Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false
  Rails.application.routes.default_url_options[:host] = 'localhost:3000'

  # For blocking abusive ips
  config.middleware.use Rack::Attack
  #a fix for the ever failing spec?
  config.action_dispatch.best_standards_support = :builtin

  #letter opener (hopefully will send email?)
  config.action_mailer.delivery_method = :letter_opener

   # Erik make it so letter_opener can actually display images
  config.action_mailer.asset_host = "http://localhost:3000"

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  #Default is false (changed this)
  config.action_mailer.raise_delivery_errors = true

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true
  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = false

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
  config.logger = Logger.new(STDOUT)
  config.log_level = :debug
  Rack::Timeout::Logger.disable
end
