require 'rails_helper'

RSpec.describe Notifications::DailySummary do
  subject(:notification) { described_class.new }

  describe '#message' do
    before do
      travel_to Time.utc(2020, 4, 10)
    end

    after do
      travel_back
    end

    it 'returns the daily summary message' do
      expect(notification.message).to eql(
        "**TOP Summary For April 10th, 2020**\n" \
        "0 users signed up\n" \
        "0 lessons completed\n" \
        "0 project submissions added\n" \
        '0 projects liked'
      )
    end
  end

  describe '#destination' do
    around do |example|
      ClimateControl.modify(
        DISCORD_LESSON_COMPLETION_WEBHOOK_URL: 'Lesson Completion Channel'
      ) do
        example.run
      end
    end

    it 'returns the notification destination' do
      expect(notification.destination).to eql('Lesson Completion Channel')
    end
  end
end
