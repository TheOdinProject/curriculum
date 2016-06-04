require 'rails_helper'

RSpec.describe LessonsController do
  let(:course) {
    double('Course', name: 'web-development-101', lessons: lessons )
  }
  let(:lessons) { [lesson] }
  let(:lesson) { double('Lesson') }
  let(:ad) { double('Ad') }
  let(:current_user) { double('User') }

  before do
    allow(Course).to receive(:find_by_title_url!).with("web-development-101").
      and_return(course)

    allow(lessons).to receive(:find_by_title_url!).
      with('how-this-course-will-work').and_return(lesson)
  end

  describe "GET index" do

    it 'renders the course' do
      get :index, course_name: 'web-development-101'
      expect(response).to render_template(:index)
    end

    it 'assigns @course' do
      get :index, course_name: 'web-development-101'
      expect(assigns(:course)).to eql(course)
    end
  end

  describe "GET show" do

    before do
      get :show,
      course_name: 'web-development-101',
      lesson_name: 'how-this-course-will-work'
    end

    it 'renders the lesson' do
      expect(response).to render_template(:show)
    end

    it 'assigns @course' do
      expect(assigns(:course)).to eql(course)
    end

    it 'assigns @lesson' do
      expect(assigns(:lesson)).to eql(lesson)
    end

    context 'when show_ads? is true' do
      before do
        ENV['SHOW_ADS'] = 'true'
        allow(controller).to receive(:Ad).and_return(ad)
        allow(ad).to receive(:show_ads?).with(current_user).and_return(true)

        get :show,
        course_name: 'web-development-101',
        lesson_name: 'how-this-course-will-work'
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
