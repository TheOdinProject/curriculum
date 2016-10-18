require 'rails_helper'

RSpec.describe CoursesController do
  let(:courses) { [course, course] }
  let(:course) { double('Course', id: 'abc123') }
  let(:params) { { id: 'abc123' } }
  let(:course_association) { double('CourseAssociation') }

  describe "GET index" do

    before do
      allow(Course).to receive(:order).with('position asc').
        and_return(courses)

      allow(courses).to receive(:includes).with(:lessons).
        and_return(course_association)
    end

    it 'assigns @courses' do
      get :index
      expect(assigns(:courses)).to eq(course_association)
    end

    it 'renders the courses' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET show' do

    before do
      allow(Course).to receive(:find).with('abc123').
        and_return(course)
    end

    it 'assigns @course' do
      get :show, params
      expect(assigns(:course)).to eql(course)
    end

    it 'renders the course' do
      get :show, params
      expect(response).to render_template(:show)
    end
  end
end
