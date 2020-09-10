require 'rails_helper'

RSpec.describe ProjectSubmission, type: :model do
  subject { create(:project_submission) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:lesson) }
  it { is_expected.to have_many(:flags) }

  it { is_expected.to validate_presence_of(:repo_url).with_message('Required') }
  it { is_expected.to allow_value('http://www.github.com/fff').for(:repo_url) }
  it { is_expected.to allow_value('https://www.github.com/fff').for(:repo_url) }
  it { is_expected.to_not allow_value('not_a_url').for(:repo_url) }

  it { is_expected.to validate_presence_of(:live_preview_url).with_message('Required') }
  it { is_expected.to allow_value('http://www.github.com/fff').for(:live_preview_url) }
  it { is_expected.to allow_value('https://www.github.com/fff').for(:live_preview_url) }
  it { is_expected.to_not allow_value('not_a_url').for(:live_preview_url) }

  describe '.flagged' do
    let!(:project_submission_with_no_flags) { create(:project_submission) }
    let(:project_submission_with_flag) { create(:project_submission) }
    let(:project_submission_with_resolved_flag) { create(:project_submission) }

    before do
      create(:flag, project_submission: project_submission_with_flag)
      create(:flag, project_submission: project_submission_with_resolved_flag, status: :resolved)
    end

    it 'returns project submissions have active flags' do
      expect(ProjectSubmission.flagged).to contain_exactly(project_submission_with_flag)
    end
  end

  describe '.with_no_active_flags' do
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

    it 'returns project submissions that have no active flags' do
      expect(ProjectSubmission.with_no_active_flags).to contain_exactly(
        project_submission_with_no_flags,
        project_submission_with_resolved_flag
      )
    end
  end

  describe '.with_no_active_flags' do
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

    it 'returns project submissions that have no active flags' do
      expect(ProjectSubmission.with_no_active_flags).to contain_exactly(
        project_submission_with_no_flags,
        project_submission_with_resolved_flag
      )
    end
  end

  describe '.viewable' do
    let!(:banned_project_submission) { create(:project_submission, banned: true) }
    let!(:private_project_submission) { create(:project_submission, is_public: false) }
    let!(:viewable_project_submission_one) { create(:project_submission) }
    let!(:viewable_project_submission_two) { create(:project_submission) }

    it 'returns viewable project submissions' do
      expect(ProjectSubmission.viewable).to contain_exactly(
        viewable_project_submission_one,
        viewable_project_submission_two
      )
    end
  end
end
