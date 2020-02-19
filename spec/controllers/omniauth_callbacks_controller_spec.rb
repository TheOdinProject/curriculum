require 'rails_helper'

RSpec.describe OmniauthCallbacksController, type: :controller do
  let(:user_signed_in?) { true }
  let(:user) { FactoryBot.create(:user) }
  let(:auth) { OmniAuth.config.mock_auth[:github] }
  let(:persisted) { true }

  before do
    request.env['devise.mapping'] = Devise.mappings[:user]
    request.env['omniauth.auth'] = auth

    allow(UserProvider).to receive(:find_user).with(auth).and_return(user)
    allow(user).to receive(:persisted?).and_return(persisted)
  end

  describe 'GET #github' do
    it 'redirects the user to the dashboard page' do
      get :github
      expect(response).to redirect_to(dashboard_path)
    end

    it 'displays the success flash' do
      get :github
      expect(flash[:notice]).to eql('Successfully authenticated from Github account.')
    end

    context 'when the user avatar needs updated' do
      let(:user) {
        FactoryBot.create(
          :user,
          username: 'John',
          email: 'john@example.com',
          avatar: nil
        )
      }

      it 'sets the users avatar' do
        expect(user).to receive(:update_avatar).with('http://github.com/fake-avatar')
        get :github
      end
    end

    context 'when user is not persisted and does not exist' do
      let(:persisted) { false }
      let(:user_signed_in?) { false}

      it 'stores the auth data in the session' do
        get :github
        expect(session['devise.github_data']).to eql(auth)
      end

      it 'redirects to the new users path' do
        get :github
        expect(response).to redirect_to(new_user_registration_path)
      end
    end
  end

  describe 'GET failure' do
    it 'displays the failured omniauth flash' do
      get :failure
      expect(flash[:alert]).to eql('Authentication failed.')
    end

    it 'redirects to home page' do
      get :failure
      expect(response).to redirect_to(root_path)
    end
  end
end
