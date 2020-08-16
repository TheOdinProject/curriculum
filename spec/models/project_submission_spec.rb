require 'rails_helper'

RSpec.describe ProjectSubmission, type: :model do
  subject { create(:project_submission) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:lesson) }

  it { is_expected.to validate_presence_of(:repo_url) }

  describe '#flagged' do
    let!(:project_submission_with_no_flags) { create(:project_submission) }
    let(:project_submission_with_flag) { create(:project_submission) }
    let(:project_submission_with_resolved_flag) { create(:project_submission) }

    before do
      create(:flag, project_submission: project_submission_with_flag)
      create(:flag, project_submission: project_submission_with_resolved_flag, status: :resolved)
    end

    it "returns project submissions have active flags" do
      expect(ProjectSubmission.flagged).to contain_exactly(project_submission_with_flag)
    end
  end

  describe '#with_no_active_flags' do
    let!(:project_submission_with_no_flags) { create(:project_submission) }
    let(:project_submission_with_flag) { create(:project_submission) }
    let(:project_submission_with_resolved_flag) { create(:project_submission) }
    let(:project_submission_flagged_again) { create(:project_submission) }

    before do
      create(:flag, project_submission: project_submission_with_flag)
      create(:flag, project_submission: project_submission_with_resolved_flag, status: :resolved)
      create(:flag, project_submission: project_submission_flagged_again, status: :resolved)
      create(:flag, project_submission: project_submission_flagged_again)
    end

    it "returns project submissions that have no active flags" do
      expect(ProjectSubmission.with_no_active_flags).to contain_exactly(
        project_submission_with_no_flags,
        project_submission_with_resolved_flag
      )
    end
  end
end
