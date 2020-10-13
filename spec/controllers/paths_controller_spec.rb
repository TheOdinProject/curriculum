require 'rails_helper'

RSpec.describe PathsController do
  describe 'GET #show' do
    let!(:path) { create(:path) }

    it 'returns http success' do
      get :show, params: { id: path.id }
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
