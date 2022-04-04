require 'rails_helper'

RSpec.describe AdminFlash do
  it { is_expected.to validate_presence_of(:message) }
  it { is_expected.to validate_presence_of(:expires) }

  describe '.unexpired_messages' do
    it 'returns unexpired messages' do
      admin_flash_expires_tomorrow = create(:admin_flash, expires: 1.day.from_now)
      admin_flash_expires_next_week = create(:admin_flash, expires: 1.week.from_now)
      create(:admin_flash, expires: 1.hour.ago)

      expect(described_class.unexpired_messages).to contain_exactly(
        admin_flash_expires_tomorrow, admin_flash_expires_next_week
      )
    end
  end

  describe '.showable_messages' do
    it 'returns messages that the user has not seen yet' do
      seen_unexpired_message = create(:admin_flash, expires: 1.week.from_now)
      unseen_unexpired_message = create(:admin_flash, expires: 1.day.from_now)
      create(:admin_flash, expires: 1.day.ago)

      disabled_flash_ids = [seen_unexpired_message.id]

      expect(described_class.showable_messages(disabled_flash_ids)).to contain_exactly(
        unseen_unexpired_message
      )
    end
  end
end
