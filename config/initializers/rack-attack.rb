class Rack::Attack
  Rack::Attack.blocklist('block 223.229.172.105') do |req|
  # Requests are blocked if the return value is truthy
    '223.229.172.105' == req.ip
  end
end
