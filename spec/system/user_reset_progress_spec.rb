require 'rails_helper'

RSpec.describe 'User Reset Progress', type: :system do
  let!(:user) { create(:user) }
  let!(:foundations_path) { create(:path, title: 'Foundations', default_path: true) }
  let!(:foundation_course) { create(:course, title: 'Foundations', path: foundations_path) }
  let!(:foundation_lesson) { create(:lesson, course: foundation_course) }
  let!(:foundation_completion) { create(:lesson_completion, lesson: foundation_lesson, user: user) }
  let!(:rails_path) { create(:path, title: 'Rails') }
  let!(:rails_course) { create(:course, title: 'Rails', path: rails_path) }
  let!(:rails_lesson) { create(:lesson, course: rails_course) }
  let!(:rails_completion) { create(:lesson_completion, lesson: rails_lesson, user: user, course: rails_course) }

  it 'deletes all lesson completions and resets to default path' do
    user.update(path: rails_path)
    sign_in(user)
    visit dashboard_path

    expect(user.lesson_completions.count).to eq(2)
    within(find('.skills')) do
      expect(page).to have_content(rails_course.title)
      expect(find(:test_id, 'progress-badge')).to have_text('100%')
      expect(find(:test_id, 'rails-open-btn')).to have_text('Open')
    end

    visit edit_user_registration_path
    page.accept_confirm do
      find(:test_id, 'user-reset-progress-link').click
    end
    visit dashboard_path

    expect(user.reload.path).not_to eq(rails_path)
    expect(user.lesson_completions.count).to eq(0)
    within(find('.skills')) do
      expect(page).to have_content(foundation_course.title)
      expect(find(:test_id, 'default-badge')).to have_text('')
      expect(find(:test_id, 'foundations-start-btn')).to have_text('Start')
    end
  end
end
