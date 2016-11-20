require 'rails_helper'

RSpec.describe OmniauthCallbacksController, type: :controller do
  let(:user_signed_in?) { true }
  let(:user) { double('User') }
  let(:auth) { { provider: 'github', uid: '123' } }
  let(:link_omniauth) { double('LinkOmniauth') }
  let(:link_omniauth_attributes) {
    {
      user: user,
      flash_type: :notice,
      flash_message: 'Linked Github to your account'
    }
  }
  let(:new_or_existing_omniauth_user) { double('NewOrExistingOmniauthUser') }
  let(:new_user?) { true }
  let(:user_attributes) {
    {
      username: 'kevin',
      email: 'kevin@example.com',
      uid: '123',
      provider: 'github'
    }
  }

  before do
    request.env['devise.mapping'] = Devise.mappings[:user]
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github]

    allow(controller).to receive(:user_signed_in?)
      .and_return(user_signed_in?)

    allow(controller).to receive(:current_user)
      .and_return(user)

    allow(LinkOmniauth).to receive(:new).with(user, auth)
      .and_return(link_omniauth)

    allow(link_omniauth).to receive(:create)
      .and_return(link_omniauth_attributes)

    allow(NewOrExistingOmniauthUser).to receive(:new).with(auth)
      .and_return(new_or_existing_omniauth_user)

    allow(user).to receive(:new_record?).and_return(new_user?)
  end

  describe 'GET github' do
    context 'when user is signed in' do
      it 'displays successful link flash' do
        get :github
        expect(flash[:notice]).to eql('Linked Github to your account')
      end

      it 'redirects to courses path' do
        get :github
        expect(response).to redirect_to(courses_path)
      end
    end

    context 'when user is not signed in and they need to verify details' do
      let(:user_signed_in?) { false }
      let(:new_user_attributtes) {
        {
          user: user,
          flash_type: :none,
          flash_message: ''
        }
      }
      let(:user) { double('User', attributes: user_attributes) }

      before do
        allow(new_or_existing_omniauth_user).to receive(:create)
          .and_return(new_user_attributtes)
      end

      it 'displays new user flash' do
        get :github
        expect(flash[:none]).to eql('')
      end

      it 'stores the new users attributes' do
        get :github
        expect(session['devise.user_attributes']).to eql(user_attributes)
      end

      it 'redirects to the new user registration path' do
        get :github
        expect(response).to redirect_to(new_user_registration_url)
      end
    end

    context 'when user is not signed in and they dont need to verfiy details' do
      let(:user_signed_in?) { false }
      let(:new_user?) { false }
      let(:existing_user_attributtes) {
        {
          user: user,
          flash_type: :notice,
          flash_message: 'Thanks for logging in with Github!'
        }
      }
      let(:user) { FactoryGirl.build(:user) }

      before do
        allow(new_or_existing_omniauth_user).to receive(:create)
          .and_return(existing_user_attributtes)
      end

      it 'displays existing user flash' do
        get :github
        expect(flash[:notice]).to eql('Thanks for logging in with Github!')
      end

      it 'redirects to courses page' do
        get :github
        expect(response).to redirect_to(courses_path(ref: 'login'))
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
