require 'rails_helper'

RSpec.describe LessonsController do
  let(:path) { create(:path, title: 'a path') }
  let(:course) { create(:course, title: 'a course', path: path) }
  let(:section) { create(:section, course: course) }
  let!(:lesson) { create(:lesson, title: 'a lesson', section: section) }

  describe 'GET show' do
    let(:params) do
      {
        id: 'a-lesson',
        course_id: 'a-course',
        path_id: 'a-path',
      }
    end

    it 'renders the lesson' do
      get :show, params: params
      expect(response).to render_template(:show)
    end

    it 'assigns @lesson' do
      get :show, params: params
      expect(assigns(:lesson)).to eql(lesson)
    end

    context 'when lesson cannot be found' do
      let(:params) do
        {
          id: 'a-unknown-lesson',
          course_id: 'a-course',
          path_id: 'a-path',
        }
      end

      it 'returns a status of 404' do
        get :show, params: params
        expect(response).to have_http_status(404)
      end

      it 'renders the 404 page' do
        get :show, params: params
        expect(response).to render_template(:not_found)
      end
    end
  end
end
