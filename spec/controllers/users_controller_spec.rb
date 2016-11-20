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
  end

  describe 'GET edit' do
    it 'assigns @edit' do
      get :edit, params: { id: user.id }
      expect(assigns(:edit)).to eql(true)
    end

    it 'renders the users profile' do
      get :edit, params: { id: user.id }
      expect(response).to render_template(:show)
    end
  end

  describe 'POST update' do
    it 'displays a success message' do
      post :update, params: { id: user.id, user: { email: 'kevin@example.com' } }
      expect(flash[:success]).to eql('Your profile was updated successfully')
    end

    it 'redirects to the users profile' do
      post :update, params: { id: user.id, user: { email: 'kevin@example.com' } }
      expect(response).to redirect_to("/users/#{user.id}")
    end

    context 'when there are errors' do
      it 'displays a error message' do
        post :update, params: { id: user.id, user: { email: 'kevin@' } }
        expect(flash[:error]).to eql('We could not update your profile. '\
          'Errors: ["Email is invalid"]')
      end

      it 'renders the users profile page' do
        post :update, params: { id: user.id, user: { email: 'kevin@' } }
        expect(response).to render_template(:show)
      end
    end
  end

  describe 'GET index' do
    let(:users) { [first_user, second_user] }
    let(:first_user) { double('User') }
    let(:second_user) { double('User') }
    let(:params) { { page: 'foo' } }

    before do
      allow(controller).to receive(:params).and_return(params)

      allow(User).to receive(:by_latest_completion).and_return(users)

      allow(users).to receive(:paginate)
        .with(page: params[:page], per_page: 15)
        .and_return(users)
    end

    it 'assigns @users' do
      get :index
      expect(assigns(:users)).to eql(users)
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
