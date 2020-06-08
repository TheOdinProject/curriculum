require 'rails_helper'

RSpec.describe Project, type: :model do
  subject {
    Project.new(
      repo_url: 'https://github.com/learner/repo',
      user_id: user.id,
      lesson_id: lesson.id
    )
  }
  let(:user) { double('User', id: 1) }
  let(:lesson) { double('Lesson', id: 1) }
  let(:voting_user) { double('User', id: 2) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:lesson) }

  it do
    is_expected.to validate_presence_of(:repo_url)
  end

  describe '#reported' do
    let!(:project_with_no_reports) { create(:project) }
    let(:project_with_report ) { create(:project) }
    let(:project_with_resolved_report) { create(:project) }

    before do
      create(:report, project: project_with_report)
      create(:report, project: project_with_resolved_report, status: :resolved)
    end

    it "returns projects have active reports" do
      expect(Project.reported).to contain_exactly(project_with_report)
    end
  end

  describe '#with_no_active_reports' do
    let!(:project_with_no_reports) { create(:project) }
    let(:project_with_report ) { create(:project) }
    let(:project_with_resolved_report) { create(:project) }
    let(:project_reported_again) { create(:project) }

    before do
      create(:report, project: project_with_report)
      create(:report, project: project_with_resolved_report, status: :resolved)
      create(:report, project: project_reported_again, status: :resolved)
      create(:report, project: project_reported_again)
    end

    it "returns projects that have no active reports" do
      expect(Project.with_no_active_reports).to contain_exactly(project_with_no_reports, project_with_resolved_report)
    end
  end

  describe '#upvote_for' do
    it 'calls the vote_by method from act as voteable gem' do
      expect(subject).to receive(:vote_by).with(voter: voting_user)
      subject.upvote_for(voting_user)
    end
  end

  describe '#upvote_for' do
    it 'calls the unliked_by method from act as voteable gem' do
      expect(subject).to receive(:unliked_by).with(voting_user)
      subject.remove_vote_for(voting_user)
    end
  end

  describe '#total_votes' do
    let(:votes) { [vote_one, vote_two] }
    let(:vote_one) { double('Vote') }
    let(:vote_two) { double('Vote') }

    before do
      allow(subject).to receive(:votes_for).and_return(votes)
    end

    it 'returns the number of votes' do
      expect(subject.total_votes).to eql(2)
    end
  end
end
