require 'rails_helper'

RSpec.describe TracksController do
  describe 'GET #show' do
    let!(:track) { create(:track) }

    it 'returns http success' do
      get :show, params: { id: track.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
