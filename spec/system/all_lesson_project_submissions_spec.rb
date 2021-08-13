require 'rails_helper'

RSpec.describe 'View all Project Submissions for a Lesson', type: :system do
  let(:user) { create(:user) }

  context 'when the lesson accepts project submissions' do
    let(:lesson) { create(:lesson, :project) }

    it 'paginates the results' do
      create_list(:project_submission, 20, lesson: lesson)

      sign_in(user)
      visit path_course_lesson_path(lesson.section.course.path, lesson.section.course, lesson)
      find(:test_id, 'view-all-projects-link').click

      within(:test_id, 'submissions-list') do
        expect(page).to have_selector('[data-test-id="submission-item"]', count: 15)
      end

      click_on('Next')

      within(:test_id, 'submissions-list') do
        expect(page).to have_selector('[data-test-id="submission-item"]', count: 5, visible: false)
      end
    end
  end

  context 'when the lesson does not accept project submissions' do
    let(:lesson) { create(:lesson) }

    it 'does not have an all project submissions page for the lesson' do
      sign_in(user)
      visit lesson_project_submissions_path(lesson)

      expect(page).to have_current_path(
        path_course_lesson_path(
          lesson.section.course.path,
          lesson.section.course,
          lesson
        )
      )

      expect(find(:test_id, 'flash')).to have_content('This project does not accept submissions')
    end
  end

  context 'when the user is not signed in' do
    let(:lesson) { create(:lesson, :project) }

    it 'redirects the user to the login page' do
      visit lesson_project_submissions_path(lesson)

      expect(page).to have_current_path(new_user_session_path)
    end
  end
end
