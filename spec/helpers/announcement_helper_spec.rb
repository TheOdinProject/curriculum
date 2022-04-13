require 'rails_helper'

RSpec.describe AnnouncementHelper do
  describe '#disabled_announcement_ids' do
    let(:cookies) do
      {
        'announcement_10' => 'disabled',
        'announcement_20' => 'disabled',
        'not_a_announcement_15' => 'disabled',
        'announcement_' => 'disabled'
      }
    end

    it 'returns the disabled announcement ids' do
      expect(disabled_announcement_ids).to eql([10, 20])
    end
  end
end
