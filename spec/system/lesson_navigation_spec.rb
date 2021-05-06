require 'rails_helper'

RSpec.describe 'Navigating Lessons', type: :system do
  let!(:user) { create(:user) }
  let!(:path) { create(:path, default_path: true) }
  let!(:course) { create(:course, path: path) }
  let!(:section) { create(:section, position: 1, course: course) }
  let!(:lesson) { create(:lesson, position: 1, section: section) }

  before do
    sign_in(user)
  end

  describe 'the next lesson button' do
    context 'within the same section' do
      let!(:next_lesson) { create(:lesson, position: 2, section: section) }

      it 'moves to the next lesson in the section when clicked' do
        visit path_course_lesson_path(path, course, lesson)
        find(:test_id, 'next-lesson-btn').click

        expect(find(:test_id, 'lesson-title-header')).to have_text(/#{next_lesson.title}/i)
      end
    end

    context 'when on the last lesson of a section' do
      let!(:next_section) { create(:section, position: 2, course: course) }
      let!(:next_section_lesson) { create(:lesson, position: 2, section: next_section) }

      it 'moves to the first lesson in the next section when clicked' do
        visit path_course_lesson_path(path, course, lesson)
        find(:test_id, 'next-lesson-btn').click

        expect(find(:test_id, 'lesson-title-header')).to have_text(/#{next_section_lesson.title}/i)
      end
    end

    context 'on last lesson in the course' do
      it 'should not be present' do
        visit path_course_lesson_path(path, course, lesson)

        expect(page).to have_no_selector('[data-test-id="next-lesson-btn"]')
      end
    end
  end

  describe 'the View Course button' do
    it 'directs to the course view' do
      visit path_course_lesson_path(path, course, lesson)
      find(:test_id, 'view-course-btn').click

      expect(find(:test_id, 'course-title-header')).to have_text(/#{course.title}/i)

      within '[data-test-id="course-section"]', match: :first do
        expect(page).to have_text(/#{lesson.title}/i)
      end
    end
  end

  describe 'Choose Path Lesson button' do
    let!(:choose_path_lesson) { create(:lesson, position: 2, section: section, choose_path_lesson: true) }

    it 'directs the user to the path selection page' do
      visit path_course_lesson_path(path, course, choose_path_lesson)
      find(:test_id, 'choose-path-lesson-btn').click

      expect(page).to have_current_path(paths_path)
    end
  end
end
