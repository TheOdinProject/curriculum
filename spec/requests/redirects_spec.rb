require 'rails_helper'

RSpec.describe 'Redirects', type: :request do
  context 'when a request is made to web development 101 paths' do
    it 'redirects the old web development 101 course path to the foundations path' do
      get '/courses/web-development-101'
      expect(response).to redirect_to('/paths/foundations')
    end

    it 'redirects the old web development 101 lesson paths to the foundations path' do
      get '/courses/web-development-101/lessons/a-lesson'
      expect(response).to redirect_to('/paths/foundations')
    end
  end
end
