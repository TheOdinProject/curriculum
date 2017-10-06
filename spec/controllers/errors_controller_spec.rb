require 'rails_helper'

RSpec.describe ErrorsController do

  describe '#not_found' do

    it 'renders the 404 page' do
      get :not_found
      expect(response).to render_template(:not_found)
    end
  end
end
