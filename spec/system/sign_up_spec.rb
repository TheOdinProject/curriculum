require 'rails_helper'

RSpec.describe 'Sign Up', type: :system do
  let!(:default_path) { create(:path, title: 'Foundations', default_path: true) }

  before do
    visit root_path
    find(:test_id, 'nav-signup').click
  end

  context 'when using email and password to sign up' do
    it 'signs up successfully' do
      find(:test_id, 'username_field').fill_in(with: 'codesquad64')
      find(:test_id, 'email_field').fill_in(with: 'codesquad64@gmail.com')
      find(:test_id, 'password_field').fill_in(with: 'partyparrot128')
      find(:test_id, 'password_confirmation_field').fill_in(with: 'partyparrot128')
      find(:test_id, 'submit_btn').click

      expect(find(:test_id, 'profile_username')).to have_content('codesquad64')
    end
  end

  context 'when invalid' do
    it 'validates the sign in fields' do
      find(:test_id, 'username_field').fill_in(with: 'c')
      find(:test_id, 'email_field').fill_in(with: 'codesquad64@')
      find(:test_id, 'password_field').fill_in(with: 'partyparrot128')
      find(:test_id, 'password_confirmation_field').fill_in(with: 'partyparrot18')
      find(:test_id, 'submit_btn').click

      expect(page).to have_content('is too short (minimum is 4 characters)')
      expect(page).to have_content('is not a valid email')
      expect(page).to have_content('The passwords do not match')
      expect(page).to have_current_path(sign_up_path)
    end
  end

  context 'when using github oauth to signup' do
    before do
      mock_oauth_provider(:github)
    end

    after do
      OmniAuth.config.mock_auth[:github] = nil
    end

    it 'can sign up with github' do
      find(:test_id, 'github-btn').click
      expect(find(:test_id, 'profile_username')).to have_content('chrissy shenko')
    end

    context 'when invalid credentials are provided' do
      before do
        OmniAuth.config.mock_auth[:github] = :invalid_credentials
      end

      it 'handles failed signup' do
        find(:test_id, 'github-btn').click

        expect(page).to have_current_path(new_user_session_path)
        expect(find(:test_id, 'flash')).to have_text('Authentication failed')
      end
    end

    context 'when user has an existing account with the same email' do
      it 'signs them in' do
        user = create(
          :user,
          email: 'odinstudent@example.com',
          path: default_path,
          learning_goal: 'Become a software engineer'
        )

        sign_in(user)
        visit dashboard_path
        expect(find(:test_id, 'learning_goal')).to have_content(user.learning_goal)

        sign_out(:user)
        visit new_user_registration_path
        find(:test_id, 'github-btn').click
        expect(find(:test_id, 'learning_goal')).to have_content(user.learning_goal)
      end
    end
  end

  context 'when using google oauth to signup' do
    before do
      mock_oauth_provider(:google)
    end

    after do
      OmniAuth.config.mock_auth[:google] = nil
    end

    it 'can sign up with google' do
      find(:test_id, 'google-btn').click
      expect(find(:test_id, 'profile_username')).to have_content('chrissy shenko')
    end

    context 'when user has an existing account with the same email' do
      it 'signs them in' do
        user = create(
          :user,
          email: 'odinstudent@example.com',
          path: default_path,
          learning_goal: 'Become a software engineer'
        )

        sign_in(user)
        visit dashboard_path
        expect(find(:test_id, 'learning_goal')).to have_content(user.learning_goal)

        sign_out(:user)
        visit new_user_registration_path
        find(:test_id, 'google-btn').click
        expect(find(:test_id, 'learning_goal')).to have_content(user.learning_goal)
      end
    end

    context 'when invalid credentials are provided' do
      before do
        OmniAuth.config.mock_auth[:google] = :invalid_credentials
      end

      it 'handles failed signup' do
        find(:test_id, 'google-btn').click

        expect(page).to have_current_path(new_user_session_path)
        expect(find(:test_id, 'flash')).to have_text('Authentication failed')
      end
    end
  end
end
