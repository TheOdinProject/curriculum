require 'rails_helper'

RSpec.describe ConfirmationsController do

  describe 'GET show' do
    let(:user) { FactoryGirl.create(:user, confirmed_at: nil) }

    before do
      request.env["devise.mapping"] = Devise.mappings[:user]
    end

    it 'signs in the user' do
      get :show, confirmation_token: user.confirmation_token
      expect(controller.current_user).to eql(user)
    end

    it 'displays a flash message' do
      get :show, confirmation_token: user.confirmation_token
      expect(flash[:notice]).to eql('Thanks for confirming your email address!')
    end
    it 'redirects to courses path' do
      get :show, confirmation_token: user.confirmation_token
      expect(response).to redirect_to('/courses')
    end
  end
end
