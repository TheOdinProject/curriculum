require 'rails_helper'

RSpec.describe 'Static Pages', type: :request do
  describe 'GET #path' do
    context 'when path has more than one course' do
      it 'renders the path page' do
        path = create(:path)
        create(:course, path: path)
        create(:course, path: path)

        get path_url(path)

        expect(response).to render_template(:show)
      end
    end

    context 'when path only has one course' do
      it 'redirects to the course' do
        path = create(:path)
        course = create(:course, path: path)

        get path_url(path)

        expect(response).to redirect_to(path_course_path(path, course))
      end
    end
  end
end
