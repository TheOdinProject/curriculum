require 'rails_helper'

RSpec.describe ProjectSubmissionSerializer do
  subject { described_class.as_json(project_submission, current_user) }

  let(:project_submission) do
    create(
      :project_submission,
      id: 1,
      repo_url: 'https://www.repourl.com/path',
      live_preview_url: 'https://www.livepreviewurl.com/path',
      is_public: false,
      user: user,
      lesson: lesson
    )
  end
  let(:current_user) { create(:user) }

  let(:user) { create(:user, id: 123, username: 'A USERNAME') }
  let(:path) { create(:path, title: 'A Path') }
  let(:course) { create(:course, title: 'A Course', path: path) }
  let(:section) { create(:section, course: course) }
  let(:lesson) { create(:lesson, id: 12, title: 'A LESSON TITLE', has_live_preview: true, section: section) }

  describe '#as_json' do
    let(:serialized_project_submission) do
      {
        id: 1,
        repo_url: 'https://www.repourl.com/path',
        live_preview_url: 'https://www.livepreviewurl.com/path',
        is_public: false,
        user_name: 'A USERNAME',
        user_id: 123,
        lesson_id: 12,
        lesson_title: 'A LESSON TITLE',
        lesson_path: '/paths/a-path/courses/a-course/lessons/a-lesson-title',
        lesson_has_live_preview: true,
        likes: 0,
        is_liked_by_current_user: false
      }
    end

    it { is_expected.to eql(serialized_project_submission) }
  end
end
