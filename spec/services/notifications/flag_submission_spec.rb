require 'rails_helper'

RSpec.describe Notifications::FlagSubmission do
  subject(:notification) { described_class.new(
    flagger: flagger_user, 
    project_submission: flagged_submission, 
    reason:'I find it offensive'
    ) }
  let(:flagger_user) { create(:user, username: 'OdinUser') }
  let(:flagged_submission) { create(:project_submission) }

  describe '#message' do

    it 'returns the daily summary message' do
      expect(notification.message).to match(
        /OdinUser has flagged \d+\nReason: I find it offensive/
      )
    end
  end

  describe '#destination' do

    around do |example|
      ClimateControl.modify(
        DISCORD_FLAGGED_SUBMISSIONS_CHANNEL: 'Flagged Submission Channel'
      ) do
        example.run
      end
    end

    it 'returns the notification destination' do
      expect(notification.destination).to eql('Flagged Submission Channel')
    end

  end
end
