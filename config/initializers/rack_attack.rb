class Rack::Attack
  Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new

  Rack::Attack.throttle('report_ip', limit: 3, period: 60) do |request|
    request.ip if request.path.ends_with?('/flags') && request.post?
  end
end
