require 'rails_helper'

RSpec.describe Notifications::FlagSubmission do
  subject(:notification) { described_class.new(flag) }

  let(:flagger) { create(:user, username: 'OdinUser') }
  let(:flagged_submission) { create(:project_submission) }
  let(:flag) { create(:flag, flagger: flagger, project_submission: flagged_submission, reason: 'I find it offensive') }

  describe '#message' do
    it 'returns the daily summary message' do
      notification_message = "OdinUser has flagged a submission on #{flagged_submission.lesson.title}\n" \
                             "Reason: I find it offensive\n" \
                             "Resolve the flag here: https://www.theodinproject.com/admin/flags/#{flag.id}"

      expect(notification.message).to eq notification_message
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
