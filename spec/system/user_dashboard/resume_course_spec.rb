require 'rails_helper'

RSpec.describe 'Resuming Course from User Dashboard', type: :system do
  let!(:default_path) { create(:path, default_path: true) }
  let!(:foundations_course) { create(:course, title: 'Foundations', path: default_path) }
  let!(:incomplete_lesson) { create(:lesson, course: foundations_course) }

  context 'when user has completed first lesson in course' do
    before do
      lesson = create(:lesson, course: foundations_course)

      sign_in(create(:user))

      visit lesson_path(lesson)
      find(:test_id, 'complete-button').click

      visit dashboard_path
    end

    it 'has button to resume course' do
      expect(find(:test_id, 'foundations-resume-btn')).to have_text('Resume')
    end

    it 'successfully resumes next incomplete lesson' do
      find(:test_id, 'foundations-resume-btn').click

      expect(page).to have_current_path(lesson_path(incomplete_lesson))
    end
  end
end
