require 'rails_helper'

RSpec.describe CoursesController do
  let(:path) { create(:path, title: 'a path') }
  let(:course) { create(:course, title: 'a course', path: path) }
  let(:decorated_course) { instance_double(CourseDecorator) }

  before do
    allow(CourseDecorator).to receive(:new).with(course).and_return(decorated_course)
  end

  describe 'GET show' do
    it 'assigns @course' do
      get :show, params: { id: 'a-course', path_id: 'a-path' }
      expect(assigns(:course)).to eq(decorated_course)
    end

    it 'renders the course' do
      get :show, params:  { id: 'a-course', path_id: 'a-path' }
      expect(response).to render_template(:show)
    end
  end
end
