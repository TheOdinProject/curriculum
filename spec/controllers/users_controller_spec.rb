require 'rails_helper'

RSpec.describe UsersController do
  let(:user) { FactoryGirl.create(:user) }

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
end
