require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Theodinproject
  class Application < Rails::Application
    config.assets.initialize_on_precompile = false
    config.active_support.escape_html_entities_in_json = true
    config.assets.enabled = true
    config.assets.version = '1.0'
    # config.i18n.enforce_available_locales = false
    
    Disqus::defaults[:account] = ENV['DISQUS_ACCOUNT_NAME']
    Disqus::defaults[:developer] = true
    Disqus::defaults[:avatar_size]    = 24, # squared pixel size of avatars
    Disqus::defaults[:color]          = 'grey', # theme color
    Disqus::defaults[:container_id] = "disqus_thread"
    Disqus::defaults[:show_powered_by] = false

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
  end
end
