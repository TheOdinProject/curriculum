require 'rails_helper'

RSpec.describe RegistrationsController do

  before do
    request.env['devise.mapping'] = Devise.mappings[:user]
  end

  describe 'POST #create' do
    let(:list_id) { ENV['MAILCHIMP_LIST_ID'] }
    let(:email) { 'kevin@bazfiz.com' }
    let(:user_attributes) {
      {
        username: 'kevin',
        email: email,
        password: 'foobar1',
        password_confirmation: 'foobar1',
      }
    }
    let(:user) do
      User.create(user_attributes)
    end

    before do
      allow(MailchimpSubscription).to receive(:create)
      allow(controller).to receive(:resource).and_return(user)
    end

    it 'redirects to the dashboard' do
      post :create, params: { user: user_attributes }
      expect(response).to redirect_to(dashboard_path)
    end


    it 'registers the new user on the mailchimp mailing list', if: ENV['MAILCHIMP_LIST_ID'] do
      expect(MailchimpSubscription).to receive(:create)
        .with(
          email: user.email,
          username: user.username,
          signup_date: user.created_at
        )

      post :create, params: { user: user_attributes }
    end
  end

  describe 'PATCH #update' do
    let(:user) { FactoryBot.create(:user) }
    let(:updated_attributes) {
      {
        email: 'kevin@email.com',
        current_password: user.password,
        learning_goal: 'This is me'
      }
    }

    before do
      sign_in user
    end

    it 'redirects to the home path' do
      put :update, params: { id: user.id, user: updated_attributes }
      expect(response).to redirect_to(root_path)
    end
  end
end
