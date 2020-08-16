require 'rails_helper'

RSpec.describe ProjectSubmission, type: :model do
  subject { create(:project_submission) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:lesson) }

  it { is_expected.to validate_presence_of(:repo_url) }

  describe '#reported' do
    let!(:project_submission_with_no_reports) { create(:project_submission) }
    let(:project_submission_with_report ) { create(:project_submission) }
    let(:project_submission_with_resolved_report) { create(:project_submission) }

    before do
      create(:report, project_submission: project_submission_with_report)
      create(:report, project_submission: project_submission_with_resolved_report, status: :resolved)
    end

    it "returns project submissions have active reports" do
      expect(ProjectSubmission.reported).to contain_exactly(project_submission_with_report)
    end
  end

  describe '#with_no_active_reports' do
    let!(:project_submission_with_no_reports) { create(:project_submission) }
    let(:project_submission_with_report ) { create(:project_submission) }
    let(:project_submission_with_resolved_report) { create(:project_submission) }
    let(:project_submission_reported_again) { create(:project_submission) }

    before do
      create(:report, project_submission: project_submission_with_report)
      create(:report, project_submission: project_submission_with_resolved_report, status: :resolved)
      create(:report, project_submission: project_submission_reported_again, status: :resolved)
      create(:report, project_submission: project_submission_reported_again)
    end

    it "returns project submissions that have no active reports" do
      expect(ProjectSubmission.with_no_active_reports).to contain_exactly(
        project_submission_with_no_reports,
        project_submission_with_resolved_report
      )
    end
  end
end
