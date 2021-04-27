require 'rails_helper'

RSpec.describe 'Course Lesson Completions', type: :system do
  include ButtonMatchers

  let!(:user) { create(:user) }
  let!(:path) { create(:path, default_path: true) }
  let!(:course) { create(:course, path: path) }
  let!(:section) { create(:section, course: course) }
  let!(:lesson) { create(:lesson, section: section) }

  context 'when user is signed in' do
    before do
      sign_in(user)
      visit path_course_path(path, course)
    end

    it 'can complete a lesson' do
      find(:test_id, 'lesson_complete_btn').click

      expect(user.lesson_completions.pluck(:lesson_id)).to include(lesson.id)
      expect(page).to have_submit_button('lesson_incomplete_btn')
      expect(page).to have_no_submit_button('lesson_complete_btn')
    end

    it 'can change a completed lesson to incomplete' do
      find(:test_id, 'lesson_complete_btn').click

      expect(user.lesson_completions.pluck(:lesson_id)).to include(lesson.id)

      find(:test_id, 'lesson_incomplete_btn').click

      expect(user.lesson_completions.pluck(:lesson_id)).not_to include(lesson.id)
      expect(page).to have_submit_button('lesson_complete_btn')
      expect(page).to have_no_submit_button('lesson_incomplete_btn')
    end
  end

  context 'when user is not signed in' do
    it 'cannot complete a lesson' do
      visit path_course_path(path, course)

      expect(page).to have_no_submit_button('lesson_incomplete_btn')
      expect(page).to have_no_submit_button('lesson_complete_btn')
    end
  end
end
