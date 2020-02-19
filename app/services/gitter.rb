require 'json'

module Gitter
  class Client
    attr_reader :connection, :token

    def initialize(token:)
      @token = token
      @connection = Faraday.new(headers: headers)
    end

    def send_message(text:, room_id:)
      connection.post do |req|
        req.url "https://api.gitter.im/v1/rooms/#{room_id}/chatMessages"
        req.body = { text: text }.to_json
      end
    end

    private

    def headers
      {
        'Content-Type' => 'application/json',
        'Accept' => 'application/json',
        'Authorization' => "Bearer #{token}"
      }
    end
  end
end
