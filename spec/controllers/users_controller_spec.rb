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

  describe 'GET send_confirmation_link' do
    before do
      allow(controller).to receive(:current_user).and_return(user)
      allow(user).to receive(:send_confirmation_link)
      allow(controller).to receive(:request).and_return(request)
      allow(request).to receive(:referer).and_return('/courses')
    end

    it 'sends the confirmation instructions' do
      expect(user).to receive(:send_confirmation_instructions)
      get :send_confirmation_link, params: { id: user.id }
    end

    it 'displays a notice' do
      get :send_confirmation_link, params: { id: user.id }
      expect(flash[:notice]).to eql('Confirmation instructions have been sent '\
        'to your email address!')
    end

    it 'redirects to the referer' do
      get :send_confirmation_link, params: { id: user.id }
      expect(response).to redirect_to(courses_path)
    end
  end
end
