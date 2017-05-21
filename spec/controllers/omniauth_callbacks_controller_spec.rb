require 'rails_helper'

RSpec.describe OmniauthCallbacksController, type: :controller do
  let(:user_signed_in?) { true }
  let(:user) { FactoryGirl.create(:user) }
  let(:auth) { OmniAuth.config.mock_auth[:github] }
  let(:persisted) { true }

  let(:link_omniauth) {
    double('
      LinkOmniauth',
      create: link_omniauth_attributes
    )
  }

  let(:link_omniauth_attributes) {
    {
      user: user,
      flash_type: :notice,
      flash_message: 'Successfully linked Github to your account.'
    }
  }

  before do
    request.env['devise.mapping'] = Devise.mappings[:user]
    request.env['omniauth.auth'] = auth

    allow(User).to receive(:from_omniauth).with(auth).and_return(user)
    allow(controller).to receive(:user_signed_in?).and_return(user_signed_in?)
    allow(user).to receive(:persisted?).and_return(persisted)
    allow(LinkOmniauth).to receive(:new).and_return(link_omniauth)
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe 'GET #github' do
    it 'redirects the user to some page' do
      get :github
      expect(response).to redirect_to(courses_path(ref: 'login'))
    end

    it 'displays the success flash' do
      get :github
      expect(flash[:notice]).to eql('Successfully authenticated from GitHub account.')
    end

    context 'when user already exists' do
      let(:persisted) { false }

      it 'displays a succesful omniauth link flash' do
        get :github
        expect(flash[:notice]).to eql('Successfully linked Github to your account.')
      end

      it 'redirects to the courses path' do
        get :github
        expect(response).to redirect_to(courses_path(ref: 'login'))
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
