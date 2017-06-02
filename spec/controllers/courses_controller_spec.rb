require 'rails_helper'

RSpec.describe CoursesController do
  let(:course_id) { 'abc123' }
  let(:course) { double('Course', id: course_id) }
  let(:courses) { [course] }

  describe 'GET index' do
    before do
      allow(Course).to receive(:order).with(:position).and_return(courses)
    end

    it 'assigns @courses' do
      get :index
      expect(assigns(:courses)).to eq(courses)
    end

    it 'renders the :index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET show' do
    let(:sections) { double('Sections') }

    before do
      allow(Course).to receive(:friendly).and_return(course)
      allow(course).to receive(:find).with(course_id).and_return(course)
      allow(course).to receive(:sections_in_course).and_return(sections)
    end

    it 'assigns @course' do
      get :show, params: { id: course_id }
      expect(assigns(:course)).to eql(course)
    end

    it 'renders the course' do
      get :show, params: { id: course_id }
      expect(response).to render_template(:show)
    end
  end
end
