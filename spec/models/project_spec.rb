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
      .with_message('must start with http://github.com/ or https://github.com/')
  end

  it do
    is_expected.to allow_values(
      'https://github.com/username/repo_name',
      'http://github.com/username/repo_name'
    ).for(:repo_url)
  end

  it do
    is_expected.not_to allow_values(
      'url',
      'www.github.com',
      'http://github.com',
      'https://github.com'
    ).for(:repo_url)
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
