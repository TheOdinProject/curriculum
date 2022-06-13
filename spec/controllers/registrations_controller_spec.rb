require 'rails_helper'

RSpec.describe RegistrationsController do
  before do
    request.env['devise.mapping'] = Devise.mappings[:user]
  end

  describe 'POST #create' do
    let(:email) { 'kevin@bazfiz.com' }
    let(:user_attributes) do
      {
        username: 'kevin',
        email:,
        password: 'foobar1',
        password_confirmation: 'foobar1',
      }
    end
    let(:user) { User.create(user_attributes) }

    before do
      create(:path, id: 1)
    end

    it 'redirects to the dashboard' do
      post :create, params: { user: user_attributes }
      expect(response).to redirect_to(dashboard_path)
    end
  end

  describe 'PATCH #update' do
    let(:user) { create(:user) }
    let(:updated_attributes) do
      {
        email: 'kevin@email.com',
        current_password: user.password,
        learning_goal: 'This is me'
      }
    end

    before do
      sign_in user
    end

    it 'redirects to the home path' do
      put :update, params: { id: user.id, user: updated_attributes }
      expect(response).to redirect_to(root_path)
    end
  end
end
