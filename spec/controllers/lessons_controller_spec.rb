require 'rails_helper'

RSpec.describe LessonsController do
  let(:course) {
    double('Course', name: 'web-development-101', lessons: lessons)
  }
  let(:lessons) { [lesson, lesson]}
  let(:lesson) { double('Lesson') }
  let(:ad) { double('Ad') }
  let(:current_user) { double('User') }
  let(:course_title) { 'web-development-101' }
  let(:lesson_title) { 'how-this-course-will-work' }

  before do
    allow(Course).to receive(:find_by).with(title_url: course_title).
      and_return(course)

    allow(lessons).to receive(:find_by).with(title_url: lesson_title).
      and_return(lesson)
  end

  describe "GET index" do

    it 'renders the course' do
      get :index, course_name: course_title
      expect(response).to render_template(:index)
    end

    it 'assigns @course' do
      get :index, course_name: course_title
      expect(assigns(:course)).to eql(course)
    end

    context 'when course cannot be found' do
      let(:course_title) { 'web-development' }
      before do
        allow(Course).to receive(:find_by).with(title_url: course_title).
          and_raise(ActiveRecord::RecordNotFound)
      end

      it 'returns a RoutingError' do
        expect { get :index, course_name: course_title}.
          to raise_error(ActionController::RoutingError)
      end
    end
  end

  describe "GET show" do

    it 'renders the lesson' do
      get :show,
      course_name: course_title,
      lesson_name: lesson_title

      expect(response).to render_template(:show)
    end

    it 'assigns @course' do
      get :show,
      course_name: course_title,
      lesson_name: lesson_title

      expect(assigns(:course)).to eql(course)
    end

    it 'assigns @lesson' do
      get :show,
      course_name: course_title,
      lesson_name: lesson_title

      expect(assigns(:lesson)).to eql(lesson)
    end

    context 'when course can not be found' do
      let(:course_title) { 'web-development' }
      before do
        allow(Course).to receive(:find_by).with(title_url: course_title).
          and_raise(ActiveRecord::RecordNotFound)
      end

      it 'returns a RoutingError' do
        expect{
          get :show,
          course_name: course_title,
          lesson_name: lesson_title
        }.to raise_error(ActionController::RoutingError)
      end
    end

    context 'when lesson cannot be found' do
      let(:lesson_title) { 'how-this-course-will' }
      before do
        allow(lessons).to receive(:find_by).with(title_url: lesson_title).
          and_raise(ActiveRecord::RecordNotFound)
      end

      it 'returns a RoutingError' do
        expect{
          get :show,
          course_name: course_title,
          lesson_name: lesson_title
        }.to raise_error(ActionController::RoutingError)
      end
    end

    context 'when show_ads? is true' do
      before do
        ENV['SHOW_ADS'] = 'true'
        allow(controller).to receive(:Ad).and_return(ad)
        allow(ad).to receive(:show_ads?).with(current_user).and_return(true)

        get :show,
        course_name: course_title,
        lesson_name: lesson_title
      end

      it 'assigns @lower_banner_ad' do
        expect(assigns(:lower_banner_ad)).to eql(true)
      end

      it 'assigns @right_box_ad' do
        expect(assigns(:right_box_ad)).to eql(true)
      end
    end
  end
end
