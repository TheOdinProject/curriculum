require 'rails_helper'

RSpec.describe RegistrationsController, :type => :controller do

  before do
    request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe 'POST create' do
    let(:user_attributes) {
      {
        username: 'kevin',
        email: 'kevin@example.com',
        password: 'foobar1',
        password_confirmation: 'foobar1',
        legal_agreement: true,
      }
    }
    let(:session) { {} }

    before do
      allow(controller).to receive(:session).and_return(session)
    end

    it 'redirects to the courses path' do
      post :create, params: { user: user_attributes }
      expect(response).to redirect_to('/courses?newuser=true&ref=signup')
    end

    context 'when a previous url is stored in the session' do
      let(:session) { { previous_url: '/home' } }

      it 'redirects to the home path' do
        post :create, params: { user: user_attributes }
        expect(response).to redirect_to('/home')
      end
    end
  end

  describe 'PATCH update' do
    let(:user) { FactoryGirl.create(:user) }
    let(:updated_attributes) {
      { email: 'kevin@email.com', current_password: user.password }
    }

    before do
      sign_in user
    end

    it 'redirects to the courses path' do
      put :update, params: { id: user.id, user: { about: 'This is me', current_password: user.password } }
      expect(response).to redirect_to('/courses')
    end
  end
end
