require 'rails_helper'

RSpec.describe 'Course Progress Badge', type: :system do
  let!(:path) { create(:path, default_path: true) }
  let!(:course) { create(:course, path: path) }
  let!(:section) { create(:section, course: course) }
  let!(:first_lesson) { create(:lesson, section: section) }
  let!(:second_lesson) { create(:lesson, section: section) }
  let!(:user) { create(:user) }

  before do
    sign_in(user)
  end

  context 'when course has not been started' do
    it 'does not show progress percentage' do
      visit path_course_path(path, course)

      within find(:test_id, 'default-badge') do
        expect(page).not_to have_content('0%')
      end
    end
  end

  context 'when course has some progress' do
    it 'shows percentage of completion' do
      visit path_course_lesson_path(path, course, first_lesson)
      find(:test_id, 'complete_btn').click
      visit path_course_path(path, course)

      within find(:test_id, 'progress-badge') do
        expect(page).to have_content('50%')
      end
    end
  end

  context 'when course is completed' do
    it 'shows 100% completion' do
      visit path_course_lesson_path(path, course, first_lesson)
      find(:test_id, 'complete_btn').click
      visit path_course_lesson_path(path, course, second_lesson)
      find(:test_id, 'complete_btn').click
      visit path_course_path(path, course)

      within find(:test_id, 'progress-badge') do
        expect(page).to have_content('100%')
      end
    end
  end
end
