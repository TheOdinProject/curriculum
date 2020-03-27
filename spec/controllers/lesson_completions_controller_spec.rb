require 'rails_helper'

RSpec.describe LessonCompletionsController do
  let(:user) { create(:user) }
  let(:lesson) { create(:lesson) }

  let(:lesson_completion_attrs) do
    {
      lesson_id: lesson.id,
      student_id: user.id
    }
  end

  context 'unauthenticated user' do
    describe 'POST #create' do
      it 'returns unauthorized status' do
        post :create, params: lesson_completion_attrs, xhr: true
        expect(response).to have_http_status(:unauthorized)
      end
    end

    describe 'DELETE #destroy' do
      it 'returns unauthorized status' do
        delete :destroy, params: { lesson_id: lesson.id }, xhr: true
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  context 'authenticated user' do
    before do
      allow(controller).to receive(:current_user).and_return(user)
    end

    describe 'POST #create' do
      it 'saves the lesson_completion record to the database' do
        expect { post :create, params: lesson_completion_attrs, xhr: true }.to change(user.lesson_completions, :count).by(1)
      end

      it 'renders the :create template' do
        post :create, params: lesson_completion_attrs, xhr: true
        expect(response).to render_template(:create)
      end
    end

    describe 'DELETE #destroy' do
      let!(:lesson_completion) { create(:lesson_completion, lesson: lesson, student: user) }

      it 'destroys the lesson_completion object' do
        expect { delete :destroy, params: lesson_completion_attrs, xhr: true }.to change(user.lesson_completions, :count).by(-1)
      end

      it 'renders the create template' do
        delete :destroy, params: { lesson_id: lesson.id}, xhr: true
        expect(response).to render_template(:create)
      end
    end
  end
end
