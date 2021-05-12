require 'rails_helper'

RSpec.describe 'Admin Flags', type: :system do
  let!(:flag) { create(:flag, project_submission: project_submission) }
  let(:user) { create(:user, admin: true) }
  let(:project_submission) { create(:project_submission, lesson: lesson, user: submission_owner) }
  let(:lesson) { create(:lesson, is_project: true, accepts_submission: true) }
  let(:submission_owner) { create(:user, username: 'Simon Bell', email: 'simon@example.com', password: 'pa55word') }

  before do
    sign_in(user)
    visit admin_flags_path

    within("#flag_#{flag.id}") do
      find('a.resource_id_link').click
    end
  end

  context 'when handling the flag by dismissing it' do
    before do
      page.accept_confirm do
        find(:test_id, 'dismiss-flag-btn').click
      end
    end

    it 'lets the admin know the flag has been successfully dismissed' do
      expect(page).to have_current_path(admin_flag_path(flag))
      expect(page).to have_content('Success: Flag has been dismissed.')
    end

    it 'disables the flag action buttons' do
      expect(find(:test_id, 'dismiss-flag-btn')).to be_disabled
      expect(find(:test_id, 'remove-submission-btn')).to be_disabled
      expect(find(:test_id, 'ban-user-btn')).to be_disabled
    end
  end

  context 'when handling the flag by removing the submission' do
    before do
      page.accept_confirm do
        find(:test_id, 'remove-submission-btn').click
      end
    end

    it 'lets the admin know the submission has been successfully removed' do
      expect(page).to have_current_path(admin_flags_path)
      expect(page).to have_content('Success: Submission has been removed.')
    end

    it 'removes the submission from the lesson page' do
      visit path_course_lesson_path(lesson.course.path, lesson.course, lesson)

      within(:test_id, 'submissions-list') do
        expect(page).not_to have_content(submission_owner.username)
      end
    end

    it 'shows the flag in the resolved list' do
      visit admin_flags_path(scope: 'resolved')

      expect(page).to have_content(flag.id)
    end
  end

  context 'when handling the flag by banning the submission owner' do
    before do
      page.accept_confirm do
        find(:test_id, 'ban-user-btn').click
      end
    end

    it 'lets the admin know the user has been successfully banned' do
      expect(page).to have_current_path(admin_flag_path(flag))
      expect(page).to have_content('Success: User has been banned.')
    end

    it 'disables the flag action buttons' do
      expect(find(:test_id, 'dismiss-flag-btn')).to be_disabled
      expect(find(:test_id, 'remove-submission-btn')).to be_disabled
      expect(find(:test_id, 'ban-user-btn')).to be_disabled
    end

    it 'removes the submission from the lesson' do
      visit path_course_lesson_path(lesson.course.path, lesson.course, lesson)

      within(:test_id, 'submissions-list') do
        expect(page).not_to have_content(submission_owner.username)
      end
    end

    it 'prohibits the banned user from logging in again' do
      using_session('the_banned_user') do
        visit new_user_session_path
        find(:test_id, 'email-field').fill_in(with: submission_owner.email)
        find(:test_id, 'password-field').fill_in(with: submission_owner.password)
        find(:test_id, 'submit-btn').click

        expect(page).to have_current_path(new_user_session_path)
        expect(find(:test_id, 'flash')).to have_text('Your user account has been banned')
      end
    end
  end
end
