require 'rails_helper'

RSpec.describe DiscardProjectSubmissionJob, type: :job do
  subject(:job) { described_class.new }

  describe '#perform' do
    context 'if the project_submission hasn\'t been updated for more than 7 days' do
      let!(:project_submission) { create(:project_submission, discard_at: 7.days.from_now) }

      it 'discards the project_submission' do
        travel 8.days do
          job.perform
          expect(project_submission.reload).to be_discarded
        end
      end
    end
  end
end
