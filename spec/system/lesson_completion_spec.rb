require 'rails_helper'

RSpec.describe 'Lesson Completions', type: :system do
  let!(:user) { create(:user) }
  let!(:path) { create(:path, default_path: true) }
  let!(:course) { create(:course, path: path) }
  let!(:section) { create(:section, course: course) }
  let!(:lesson) { create(:lesson, section: section) }

  context 'when user is signed in' do
    before do
      sign_in(user)
      visit path_course_lesson_path(path, course, lesson)
    end

    it 'can complete a lesson' do
      find(:test_id, 'complete_btn').click

      expect(user.lesson_completions.pluck(:lesson_id)).to include(lesson.id)
      expect(page).to have_selector('a[data-test-id="incomplete_btn"]')
      expect(page).to have_no_selector('a[data-test-id="complete_btn"]')
    end

    it 'can change a completed lesson to incomplete' do
      find(:test_id, 'complete_btn').click

      expect(user.lesson_completions.pluck(:lesson_id)).to include(lesson.id)

      find(:test_id, 'incomplete_btn').click

      expect(user.lesson_completions.pluck(:lesson_id)).not_to include(lesson.id)
      expect(page).to have_selector('a[data-test-id="complete_btn"]')
      expect(page).to have_no_selector('a[data-test-id="incomplete_btn"]')
    end
  end

  context 'when user is not signed in' do
    it 'cannot complete a lesson' do
      visit path_course_lesson_path(path, course, lesson)

      expect(page).to have_no_selector('a[data-test-id="complete_btn"]')
      expect(page).to have_no_selector('a[data-test-id="incomplete_btn"]')
      expect(find(:test_id, 'login_button')).to have_content('Login to track progress')
    end
  end
end
