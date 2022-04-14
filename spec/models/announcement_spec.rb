require 'rails_helper'

RSpec.describe Announcement do
  it { is_expected.to validate_presence_of(:message) }
  it { is_expected.to validate_presence_of(:expires_at) }

  describe '.unexpired_messages' do
    it 'returns unexpired messages' do
      announcement_expires_tomorrow = create(:announcement, expires_at: 1.day.from_now)
      announcement_expires_next_week = create(:announcement, expires_at: 1.week.from_now)
      create(:announcement, expires_at: 1.hour.ago)

      expect(described_class.unexpired_messages).to contain_exactly(
        announcement_expires_tomorrow, announcement_expires_next_week
      )
    end
  end

  describe '.showable_messages' do
    it 'returns messages that the user has not seen yet' do
      seen_unexpired_message = create(:announcement, expires_at: 1.week.from_now)
      unseen_unexpired_message = create(:announcement, expires_at: 1.day.from_now)
      create(:announcement, expires_at: 1.day.ago)

      disabled_announcement_ids = [seen_unexpired_message.id]

      expect(described_class.showable_messages(disabled_announcement_ids)).to contain_exactly(
        unseen_unexpired_message
      )
    end
  end
end
