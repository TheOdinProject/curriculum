require 'rails_helper'

RSpec.describe 'User login', type: :system do
  let!(:user) { create(:user, email: 'odinstudent@example.com') }

  context 'using an email and password' do
    context 'with valid credentials' do
      it 'allows the user to sign in' do
        visit root_path

        find(:test_id, 'user-login-link').click

        find(:test_id, 'email-field').fill_in with: user.email
        find(:test_id, 'password-field').fill_in with: user.password

        find(:test_id, 'submit-btn').click

        expect(page).to have_current_path(dashboard_path)
      end
    end

    context 'with blank input fields' do
      it 'notifies the user one or both of their credentials is invalid' do
        visit root_path

        find(:test_id, 'user-login-link').click

        find(:test_id, 'submit-btn').click

        expect(find(:test_id, 'flash')).to have_text 'Invalid email or password.'
      end
    end

    context 'with an invalid email format' do
      it 'notifies the user that the email is not valid' do
        visit root_path

        find(:test_id, 'user-login-link').click

        find(:test_id, 'email-field').fill_in with: 'aaaaaaa'
        find(:test_id, 'password-field').fill_in with: user.password

        expect(page).to have_content('is not a valid email')
      end
    end

    context 'with a password less than 6 characters' do
      it 'notifies the user that the password is not valid' do
        visit root_path

        find(:test_id, 'user-login-link').click

        find(:test_id, 'email-field').fill_in with: user.email
        find(:test_id, 'password-field').fill_in with: 'aaa'

        expect(page).to have_content('is too short (minimum is 6 characters)')
      end
    end
  end

  context 'when signing in with github auth' do
    before do
      mock_oauth_provider(:github)
    end

    after do
      OmniAuth.config.mock_auth[:github] = nil
    end

    it 'logs in the user' do
      visit root_path

      find(:test_id, 'user-login-link').click

      find(:test_id, 'github-btn').click

      expect(page).to have_current_path(dashboard_path)
    end
  end

  context 'when signing in with google auth' do
    before do
      mock_oauth_provider(:google)
    end

    after do
      OmniAuth.config.mock_auth[:google] = nil
    end

    it 'logs in the user' do
      visit root_path

      find(:test_id, 'user-login-link').click

      find(:test_id, 'google-btn').click

      expect(page).to have_current_path(dashboard_path)
    end
  end
end
