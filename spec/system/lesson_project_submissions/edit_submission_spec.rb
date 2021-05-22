require 'rails_helper'

RSpec.describe 'Editing a Project Submission', type: :system do
  let(:user) { create(:user) }
  let(:lesson) { create(:lesson, :project) }

  before do
    sign_in(user)
    visit path_course_lesson_path(lesson.section.course.path, lesson.section.course, lesson)
    Pages::ProjectSubmissions::Form.fill_in_and_submit
  end

  let(:edited_field_values) do
    {
      repo_url: 'https://github.com/edited-project-repo-url',
      live_preview_url: 'http://edited-live-preview-url.com'
    }
  end

  it 'successfully edits a submission' do
    find(:test_id, 'edit-submission-btn').click

    Pages::ProjectSubmissions::Form.new(**edited_field_values).tap do |form|
      form.fill_in
      form.submit
      form.close
    end

    users_submission = first(:test_id, 'submission-item')

    within(users_submission) do
      expect(users_submission).to have_content(user.username)
      expect(users_submission.find(:test_id, 'view-code-btn')['href']).to eq('https://github.com/edited-project-repo-url')
      expect(users_submission.find(:test_id, 'live-preview-btn')['href']).to eq('http://edited-live-preview-url.com/')
    end
  end
end
