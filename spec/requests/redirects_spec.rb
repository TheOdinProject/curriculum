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

  describe 'when a request is made to a nested path lesson' do
    it 'redirects the deeply nested path lesson to a unnested lesson' do
      course = create(:course, title: 'test course')
      create(:lesson, course: course, title: 'test lesson')

      get '/paths/a-path/courses/test-course/lessons/test-course-test-lesson'

      expect(response).to redirect_to('/lessons/test-course-test-lesson')
      expect(response).to have_http_status(:moved_permanently)
      follow_redirect!

      expect(response).to render_template(:show)
    end

    context "when the course doesn't exist" do
      it 'redirects to paths' do
        get '/paths/a-path/courses/test-course/lessons/test-course-test-lesson'

        expect(response).to redirect_to('/paths')
        expect(response).to have_http_status(:moved_permanently)
        follow_redirect!

        expect(response).to render_template(:index)
      end
    end

    context "when the course lesson doesn't exist" do
      it 'redirects to paths' do
        create(:course, title: 'test course')

        get '/paths/a-path/courses/test-course/lessons/test-course-test-lesson'

        expect(response).to redirect_to('/paths')
        expect(response).to have_http_status(:moved_permanently)
        follow_redirect!

        expect(response).to render_template(:index)
      end
    end
  end
end
