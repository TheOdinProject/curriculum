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

  it { is_expected.to allow_value('http://www.github.com/fff').for(:live_preview_url) }
  it { is_expected.to allow_value('https://www.github.com/fff').for(:live_preview_url) }
  it { is_expected.to_not allow_value('not_a_url').for(:live_preview_url) }

  describe '.viewable' do
    let!(:banned_project_submission) { create(:project_submission, banned: true) }
    let!(:private_project_submission) { create(:project_submission, is_public: false) }
    let!(:soft_deleted_project_submission)   { create(:project_submission, discarded_at: Time.zone.today) }
    let!(:viewable_project_submission_one)   { create(:project_submission) }
    let!(:viewable_project_submission_two)   { create(:project_submission) }

    it 'returns viewable project submissions' do
      expect(ProjectSubmission.viewable).to contain_exactly(
        viewable_project_submission_one,
        viewable_project_submission_two
      )
    end
  end

  describe '.created_today' do
    let!(:project_submission_created_today) do
      create(:project_submission, created_at: Time.zone.today)
    end

    let!(:project_submission_not_not_created_today) do
      create(:project_submission, created_at: Time.zone.today - 2.days)
    end

    it 'returns projects submission created today' do
      expect(ProjectSubmission.created_today).to contain_exactly(project_submission_created_today)
    end
  end
end
