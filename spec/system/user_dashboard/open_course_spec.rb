require 'rails_helper'

RSpec.describe 'Opening Course from User Dashboard', type: :system do
  let!(:default_path) { create(:path, default_path: true) }
  let!(:foundations_course) { create(:course, title: 'Foundations', path: default_path) }
  let!(:section) { create(:section, course: foundations_course) }
  let!(:first_lesson) { create(:lesson, section: section) }
  let!(:second_lesson) { create(:lesson, section: section) }
  let!(:user) { create(:user) }

  context 'when user has completed a course' do
    before do
      sign_in(user)
      visit lesson_path(first_lesson)
      find(:test_id, 'complete-button').click

      visit lesson_path(second_lesson)
      find(:test_id, 'complete-button').click

      visit dashboard_path
    end

    it 'has button to open course' do
      expect(find(:test_id, 'foundations-open-btn')).to have_text('Open')
    end

    it 'successfully opens course' do
      find(:test_id, 'foundations-open-btn').click

      expect(page).to have_current_path(path_course_path(default_path, foundations_course))
    end
  end
end
