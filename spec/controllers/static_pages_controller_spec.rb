require 'rails_helper'

RSpec.describe StaticPagesController do
  describe 'GET #home' do
    context 'guest user' do
      before do
        allow(controller).to receive(:current_user).and_return(nil)
      end

      it 'renders the home page' do
        get :home
        expect(response).to render_template(:home)
      end
    end

    context 'when user is logged in' do
      let(:user) { double('User') }

      before do
        allow(controller).to receive(:current_user).and_return(user)
      end

      it 'redirects to the dashboard' do
        get :home
        expect(response).to redirect_to(dashboard_path)
      end
    end
  end

  describe 'GET #about' do
    it 'renders the about page' do
      get :about
      expect(response).to render_template(:about)
    end
  end

  describe 'GET #terms_of_use' do
    it 'renders the terms of use page' do
      get :terms_of_use
      expect(response).to render_template(:terms_of_use)
    end
  end

  describe 'GET #success stories' do
    it 'renders the success stories page' do
      get :success_stories
      expect(response).to render_template(:success_stories)
    end
  end
end
