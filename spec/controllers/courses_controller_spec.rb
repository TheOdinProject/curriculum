require 'rails_helper'

RSpec.describe CoursesController do
  let(:course_id) { 'abc123' }
  let(:course) { double('Course', id: course_id) }
  let(:courses) { [course] }
  let(:decorated_course) { double('CourseDecorator') }

  before do
    allow(CourseDecorator).to receive(:new).with(course).
      and_return(decorated_course)
  end

  describe 'GET index' do
    before do
      allow(Course).to receive(:order).and_return(courses)
    end

    it 'assigns @courses' do
      get :index
      expect(assigns(:courses)).to eq([decorated_course])
    end

    it 'renders the :index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET show' do
    before do
      allow(Course).to receive_message_chain(:includes, :friendly, :find).
        and_return(course)
    end

    it 'assigns @course' do
      get :show, params: { id: course_id }
      expect(assigns(:course)).to eql(decorated_course)
    end

    it 'renders the course' do
      get :show, params: { id: course_id }
      expect(response).to render_template(:show)
    end
  end
end
