Sentry.init do |config|
  config.dsn = ENV['SENTRY_DSN']
  config.breadcrumbs_logger = [:active_support_logger]

  config.enabled_environments = %w[production]

  filter = ActiveSupport::ParameterFilter.new(Rails.application.config.filter_parameters)
  config.before_send = lambda { |event, _|
    filter.filter(event.to_hash)
  }

  config.send_default_pii = true
end
