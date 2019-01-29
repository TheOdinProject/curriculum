require 'rails_helper'

module Api
  RSpec.describe LessonCompletionsController do
    let(:params) { { start_date: start_date, end_date: end_date } }
    let(:start_date) { '2019/01/01' }
    let(:end_date) { '2019/01/31' }
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
    let(:between_dates) do
      (DateTime.parse(start_date)..DateTime.parse(end_date))
    end

    before do
      allow(CourseSerializer).to receive(:as_json).with(course, between_dates).
        and_return(serialized_course)
    end

    describe '#index' do
      context 'when authenticated' do

        before do
          authenticate_request
        end

        it 'returns a 200 status code' do
          get :index, params: params
          expect(response.status).to eql(200)
        end

        it 'renders serialized courses in json format' do
          get :index, params: params
          expect(JSON.parse(response.body)).to eql([serialized_course])
        end

        context 'when start and end dates are not present' do
          let(:params) { { } }
          let(:between_dates) do
            (DateTime.parse('2013/01/01')..DateTime.parse(DateTime.now.to_s))
          end

          it 'uses the default dates' do
            get :index, params: params

            expect(CourseSerializer).to have_received(:as_json).
              with(course, between_dates)
          end
        end
      end

      context 'when not authenticated' do
        it 'does not allow access' do
          get :index, params: params
          expect(response.status).to eql(401)
        end
      end
    end
  end
end
