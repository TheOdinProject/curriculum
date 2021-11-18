require 'rails_helper'

RSpec.describe 'Static Pages', type: :request do
  describe 'GET #home' do
    it 'renders the home page' do
      get home_path

      expect(response).to have_http_status(200)
      expect(response).to render_template(:home)
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
