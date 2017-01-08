Octokit.configure do |config|
  config.access_token = ENV["GITHUB_API_TOKEN"]
  config.client_id = ENV["GITHUB_APP_ID"]
  config.client_secret = ENV["GITHUB_SECRET"]
end
