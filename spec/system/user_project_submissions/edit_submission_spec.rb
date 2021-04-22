require 'rails_helper'

RSpec.describe 'Editing a Project Submission on the Dashboard', type: :system do
  let(:user) { create(:user) }
  let(:lesson) { create(:lesson, is_project: true, accepts_submission: true, has_live_preview: true) }

  before do
    create(:project_submission, user: user, lesson: lesson)
    sign_in(user)
    visit dashboard_path
  end

  let(:edited_field_values) do
    {
      repo_url: 'https://github.com/edited-project-repo-url',
      live_preview_url: 'http://edited-live-preview-url.com'
    }
  end

  it 'successfully edits a submission' do
    find(:test_id, 'edit-submission-btn').click

    Pages::ProjectSubmissions::Form.new(**edited_field_values).tap do |edit_form|
      edit_form.fill_in
      edit_form.submit
      edit_form.close
    end

    within(:test_id, 'submission-item') do
      expect(page).to have_content(lesson.title)
      expect(page.find(:test_id, 'view-code-btn')['href']).to eq('https://github.com/edited-project-repo-url')
      expect(page.find(:test_id, 'live-preview-btn')['href']).to eq('http://edited-live-preview-url.com/')
    end
  end

  it 'can make the submission private' do
    find(:test_id, 'edit-submission-btn').click

    Pages::ProjectSubmissions::Form.new.tap do |form|
      form.make_private
      form.submit
      form.close
    end

    within(:test_id, 'submissions-list') do
      expect(page).to have_content(lesson.title)
    end

    using_session('another_user') do
      visit path_course_lesson_path(lesson.section.course.path, lesson.section.course, lesson)

      within(:test_id, 'submissions-list') do
        expect(page).not_to have_content(user.username)
      end
    end
  end
end
