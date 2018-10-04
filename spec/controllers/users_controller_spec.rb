require 'rails_helper'

RSpec.describe UsersController do
  let(:user) { FactoryBot.create(:user) }

  before do
    request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in user
  end

  describe 'GET show' do
    it 'renders the users profile page' do
      get :show, params: { id: user.id }
      expect(response).to render_template(:show)
    end

    it 'assigns @user' do
      get :show, params: { id: user.id }
      expect(assigns[:user]).to eql(user)
    end
  end

  describe 'PUT update' do
    let(:serialized_user) {
      {
        'id' => user.id,
        'admin' => false,
        'username' => 'Joey',
        'email' => user.email,
      }
    }

    it 'renders the user in json format' do
      put :update, params: { id: user.id, user: { username: 'Joey'} }
      expect(JSON.parse(response.body)).to include(serialized_user)
    end
  end
end
