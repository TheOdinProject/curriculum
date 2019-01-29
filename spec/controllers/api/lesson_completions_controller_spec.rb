require 'rails_helper'

module Api
  RSpec.describe LessonCompletionsController do
    let(:params) { { days: 7 } }
    let!(:course) { create(:course, title: 'Web Development 101', position: 1) }
    let(:serialized_course) do
      {
        'title' => 'Web Development 101',
        'sections' => [
          {
            'title' => 'Installations',
            'lessons' => [
              'title' => 'Overview',
              'completions' => 1,
            ]
          }
        ]
      }
    end
    let(:username) { 'development' }
    let(:password) { 'qwerty123' }
    let(:authenticate_request) do
      request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.
      encode_credentials(username, password)
    end

    before do
      allow(CourseSerializer).to receive(:as_json).with(course, 7).
        and_return(serialized_course)
    end

    describe '#index' do
      context 'when authenticated' do

        before do
          authenticate_request
        end

        it 'returns a 200 status code' do
          get :index, params

          expect(response.status).to eql(200)
        end

        it 'renders serialized courses in json format' do
          get :index, params

          expect(JSON.parse(response.body)).to eql([serialized_course])
        end
      end

      context 'when not authenticated' do

      end
    end
  end
end
