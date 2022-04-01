require 'rails_helper'

RSpec.describe 'User Notifications', type: :system do
  let!(:flag) { create(:flag, project_submission: project_submission) }
  let(:project_submission) { create(:project_submission, lesson: lesson, user: submission_owner) }
  let(:lesson) { create(:lesson, is_project: true, accepts_submission: true, has_live_preview: true) }
  let(:submission_owner) { create(:user, username: 'Simon Bell', email: 'simon@example.com', password: 'pa55word') }
  let(:admin) { create(:user, admin: true) }

  before do
    sign_in(admin)
    visit admin_flags_path

    within("#flag_#{flag.id}") do
      find('a.resource_id_link').click
    end

    page.accept_confirm do
      find(:test_id, 'notify-broken-link-btn').click
    end

    sign_out(admin)

    sign_in(submission_owner)
  end

  context 'when the notification is unread' do
    it 'displays the unread notification icon in the users navbar' do
      visit root_path

      within(find(:test_id, 'navbar-notification-icon')) do
        expect(page).to have_selector "span[data-test-id='unread-notifications']"
      end
    end

    it 'displays the notification to the user with an unread icon' do
      visit root_path

      find(:test_id, 'navbar-notification-icon').click

      within(find(:test_id, "notification-#{submission_owner.notifications.first.id}")) do
        expect(page).to have_css '.text-nav-link-unread'
      end
    end
  end

  context 'when the notification is clicked' do
    it 'takes the user to the project lesson page' do
      visit root_path

      find(:test_id, 'navbar-notification-icon').click

      find(:test_id, "notification-#{submission_owner.notifications.first.id}").click

      expect(page).to have_current_path lesson_path(lesson)
    end
  end

  context 'when the notification is read' do
    before do
      visit root_path

      find(:test_id, 'navbar-notification-icon').click

      find(:test_id, "notification-#{submission_owner.notifications.first.id}").click
    end

    it 'does not display the unread notification icon' do
      visit root_path

      within(find(:test_id, 'navbar-notification-icon')) do
        expect(page).not_to have_selector "span[data-test-id='unread-notifications']"
      end
    end

    it 'displays the notification to the user with a read icon' do
      visit root_path

      find(:test_id, 'navbar-notification-icon').click

      within(find(:test_id, "notification-#{submission_owner.notifications.first.id}")) do
        expect(page).to have_css '.text-nav-link-read'
      end
    end
  end
end
