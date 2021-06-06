require 'rails_helper'

RSpec.describe 'Static Pages', type: :request do
  describe 'GET #home' do
    context 'when guest user' do
      it 'renders the home page' do
        get home_path

        expect(response).to have_http_status(200)
        expect(response).to render_template(:home)
      end
    end

    context 'when user is signed in' do
      it 'redirects to the users dashboard' do
        user = create(:user)

        sign_in(user)
        get home_path

        expect(response).to redirect_to(dashboard_path)
      end
    end
  end

  describe 'GET #about' do
    it 'renders the about page' do
      get about_path

      expect(response).to have_http_status(200)
      expect(response).to render_template(:about)
    end
  end

  describe 'GET #terms_of_use' do
    it 'renders the terms of use page' do
      get terms_of_use_path

      expect(response).to have_http_status(200)
      expect(response).to render_template(:terms_of_use)
    end
  end

  describe 'GET #success stories' do
    it 'renders the success stories page' do
      get success_stories_path

      expect(response).to have_http_status(200)
      expect(response).to render_template(:success_stories)
    end
  end
end
