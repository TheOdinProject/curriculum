require 'rails_helper'

RSpec.describe DiscordNotifier do
  let(:notification) do
    instance_double(Notifications::DailySummary, message: 'A MESSAGE', destination: 'https://A-DESTINATION')
  end

  describe '#notify' do
    it 'sends the notification to discord' do
      VCR.use_cassette('discord_notification', record: :once, match_requests_on: [:method]) do
        response = described_class.notify(notification)
        expect(response.code).to be(204)
      end
    end
  end
end
