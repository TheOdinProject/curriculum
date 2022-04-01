require 'rails_helper'

RSpec.describe 'User Accounts', type: :system do
  let!(:user) do
    create(
      :user,
      username: 'Jeremy Beagle',
      email: 'jezza@beagle.com',
      learning_goal: 'Javascript'
    )
  end

  before do
    sign_in(user)
    visit edit_user_registration_path
  end

  describe('editing profile details') do
    context 'updating a valid name and email address' do
      it 'updates successfully' do
        expect(find(:test_id, 'settings-view-username').text).to eq 'Jeremy Beagle'
        expect(find(:test_id, 'settings-view-email')).to have_content 'jezza@beagle.com'

        find(:test_id, 'user-edit-profile-btn').click

        find(:test_id, 'edit-username-input').fill_in with: 'Joseph Bloggs'
        find(:test_id, 'edit-user-email-field').fill_in with: 'joey@bloggs.com'
        find(:test_id, 'edit-user-submit-btn').click

        expect(find(:test_id, 'settings-view-username')).to have_content 'Joseph Bloggs'
        expect(find(:test_id, 'settings-view-email')).to have_content 'joey@bloggs.com'

        expect(user.reload.username).to eq 'Joseph Bloggs'
        expect(user.reload.email).to eq 'joey@bloggs.com'
      end
    end
  end

  describe('editing the learning goal') do
    it 'saves the changes' do
      expect(find(:test_id, 'settings-view-learning-goal')).to have_content 'Javascript'

      find(:test_id, 'user-edit-learning-goal-btn').click

      find(:test_id, 'edit-learning-goal-text-field').fill_in with: 'Ruby'
      find(:test_id, 'edit-learning-goal-submit-btn').click

      expect(find(:test_id, 'settings-view-learning-goal')).to have_content 'Ruby'

      expect(user.reload.learning_goal).to eq 'Ruby'
    end
  end

  describe('clicking the delete account link') do
    context 'when the user confirms to proceed' do
      it 'deletes their account' do
        expect do
          accept_confirm do
            find(:test_id, 'user-account-delete-link').click
          end
        end.to change { User.count }.by(-1)

        expect(page).to have_current_path(new_user_session_path)
        expect(find(:test_id, 'flash'))
          .to have_text 'Bye! Your account was successfully cancelled. We hope to see you again soon.'
      end
    end
  end
end
