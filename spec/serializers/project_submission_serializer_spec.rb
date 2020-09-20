require 'rails_helper'

RSpec.describe ProjectSubmissionSerializer do
  subject { described_class.as_json(project_submission) }

  let(:project_submission) do
    instance_double(
      ProjectSubmission,
      id: 1,
      repo_url: 'www.repourl.com/path',
      live_preview_url: 'www.livepreviewurl.com/path',
      is_public: false,
      user: user,
      lesson_id: 12,
      lesson: lesson
    )
  end
  let(:user) { instance_double(User, id: 123, username: 'A USERNAME') }
  let(:lesson) { instance_double(Lesson, title: 'A LESSON TITLE') }

  describe '#as_json' do
    let(:serialized_project_submission) do
      {
        id: 1,
        repo_url: 'www.repourl.com/path',
        live_preview_url: 'www.livepreviewurl.com/path',
        is_public: false,
        user_name: 'A USERNAME',
        user_id: 123,
        lesson_id: 12,
        lesson_title: 'A LESSON TITLE',
      }
    end

    it { is_expected.to eql(serialized_project_submission) }
  end
end
