class Rack::Attack
  Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new
  spammers = ENV.fetch('SPAM_DOMAINS', '').split(/,\s*/)

  Rack::Attack.throttle('report_ip', limit: 3, period: 60) do |request|
    request.ip if request.path.ends_with?('/flags')
  end

  spammer_regexp = Regexp.union(spammers)
  Rack::Attack.blocklist('block referer spam') do |request|
    request.referer =~ spammer_regexp
  end
end
