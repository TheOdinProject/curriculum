VCR.configure do |vcr_config|
  vcr_config.cassette_library_dir = 'tmp/vcr'

  vcr_config.filter_sensitive_data('<GITHUB_API_TOKEN>') { ENV['GITHUB_API_TOKEN'] }
  vcr_config.filter_sensitive_data('<GITHUB_APP_ID>') { ENV['GITHUB_APP_ID'] }
  vcr_config.filter_sensitive_data('<GITHUB_SECRET>') { ENV['GITHUB_SECRET'] }

  vcr_config.hook_into :webmock
  vcr_config.ignore_localhost = true
end
