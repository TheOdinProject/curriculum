require 'rails_helper'

RSpec.describe 'Lesson Completions', type: :system do
  let!(:path) { create(:path, default_path: true) }
  let!(:course) { create(:course, path: path) }
  let!(:section) { create(:section, course: course) }
  let!(:lesson) { create(:lesson, section: section) }

  it 'can complete a lesson' do
    sign_in(create(:user))
    visit path_course_lesson_path(path, course, lesson)
    find(:test_id, 'complete_btn').click

    expect(find(:test_id, 'incomplete_btn')).not_to be(nil)
  end

  it 'cannot complete a lesson when not logged in' do
    visit path_course_lesson_path(path, course, lesson)
    find(:test_id, 'complete_btn').click

    expect(find(:test_id, 'complete_btn')).not_to be(nil)
    expect(find(:test_id, 'incomplete_btn')).not_to be(nil)
  end
end
