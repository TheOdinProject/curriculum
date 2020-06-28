require 'rails_helper'

RSpec.describe TracksController, type: :controller do

  describe "GET #show" do
    it "returns http success" do
      track = Track.create(title: "Rspec", description: "temp RSpec Track", position: 1)
      get :show, params: { id: track.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
