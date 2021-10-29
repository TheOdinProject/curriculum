require 'rails_helper'

RSpec.describe 'Resuming Course from User Dashboard', type: :system do
  let!(:default_path) { create(:path, default_path: true) }
  let!(:foundations_course) { create(:course, title: 'Foundations', path: default_path) }
  let!(:section) { create(:section, course: foundations_course) }
  let!(:lesson) { create(:lesson, section: section) }
  let!(:incomplete_lesson) { create(:lesson, section: section) }
  let!(:user) { create(:user) }

  context 'when user has completed first lesson in course' do
    before do
      sign_in(user)
      visit path_course_lesson_path(default_path, foundations_course, lesson)
      find(:test_id, 'complete-button').click
      visit dashboard_path
    end

    it 'has button to resume course' do
      expect(find(:test_id, 'foundations-resume-btn')).to have_text('Resume')
    end

    it 'successfully resumes next incomplete lesson' do
      find(:test_id, 'foundations-resume-btn').click

      expect(page).to have_current_path(path_course_lesson_path(default_path, foundations_course, incomplete_lesson))
    end
  end
end
