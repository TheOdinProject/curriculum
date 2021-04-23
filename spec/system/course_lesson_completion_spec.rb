require 'rails_helper'

RSpec.describe 'Course Lesson Completions', type: :system do
  let!(:path) { create(:path, default_path: true) }
  let!(:course) { create(:course, path: path) }
  let!(:section) { create(:section, course: course) }
  let!(:lesson) { create(:lesson, section: section) }

  context 'when user is signed in' do

    before do
      sign_in(create(:user))
      visit path_course_path(path, course)
    end

    it 'can complete a lesson' do
      find(:test_id, 'lesson_complete_btn').click

      expect(find(:test_id, 'lesson_incomplete_btn')).not_to be(nil)
    end

    it 'can change a completed lesson to incomplete' do
      find(:test_id, 'lesson_complete_btn').click
      find(:test_id, 'lesson_incomplete_btn').click

      expect(find(:test_id, 'lesson_complete_btn')).not_to be(nil)
    end
  end

  context 'when user is not signed in' do
    it 'cannot complete a lesson' do
      visit path_course_path(path, course)

      expect(page).to have_no_button('.section-lessons__item__icon')
    end
  end
end
